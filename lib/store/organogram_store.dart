import 'dart:convert';
import 'dart:math';

import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:organogram_2/models/entity.dart';
import 'package:organogram_2/models/node_kt.dart';
import 'package:organogram_2/models/org_node.dart';
import 'package:organogram_2/ui/helper/custom_search.dart';
import 'package:organogram_2/ui/utils/widget/header.dart';

part 'organogram_store.g.dart';

class OrganogramStore = OrganogramStoreBase with _$OrganogramStore;

abstract class OrganogramStoreBase with Store {
  @observable
  int indexView = 0;

  @observable
  bool selected = true;

  @observable
  int maxLevel = 0;

  @observable
  bool ismenuOpened = false;

  @observable
  OrgNode? selectedNode;

  @observable
  TreeViewController<OrgNode>? controller;

  @observable
  OrgNode? rootNode = OrgNode(
      person: const Entity(
        name: "Kitopi Org Chart",
        designation: "",
        imageURL: "",
      ),
    );

  @action 
  void setSelectedNode(OrgNode node) {
    selectedNode = node;
  }

  @action
  void setIndexView(int index) => indexView = index;

  @action
  void setSelected(bool value) => selected = value;

  @action
  Future<OrgNode> parseJsonFromAssets() async {
    Map<String, dynamic> _data = await rootBundle
        .loadString("assets/json/org_hierarchy.json")
        .then((jsonStr) => jsonDecode(jsonStr));
    KtNode? _ktNode = KtNode.fromJson(_data);
    OrgNode? _baseNode = OrgNode(person: _ktNode.person);
    maxLevel = _baseNode.level;
    rootNode!.clear();
    rootNode!.add(_baseNode);
    _generateTree(
      _ktNode,
      _baseNode,
    );
    await Future.delayed(const Duration(milliseconds: 200));
    return rootNode!;
  }

  void _generateTree(
    KtNode? jsonNode,
    OrgNode? rootOrgNode,
  ) {
    for (KtNode jsonNode in jsonNode!.children) {
      OrgNode _node = OrgNode(person: jsonNode.person);
      rootOrgNode!.add(_node);
      maxLevel = max(_node.level, maxLevel);
      _generateTree(jsonNode, _node);
    }
  }

  @action
  void expandAllNodes(
      OrgNode rootOrgNode) {
    // rootOrgNode.meta!.clear();
    for (var element in rootOrgNode.childrenAsList) {
      if (rootOrgNode.childrenAsList.isNotEmpty &&
          (element.meta == null || element.meta!.containsValue(false))) {
        controller!.toggleNodeExpandCollapse(element as OrgNode);
      }
      expandAllNodes(element as OrgNode);
    }
  }

  @action
  Future searchCallBack(BuildContext context) async {
    OrgNode? _node = await showDialog<OrgNode?>(
      context: context,
      barrierColor: Colors.white,
      builder: (context) {
        return SearchPage(
          delegate: SearchOrgNode(
            node: rootNode!,
          ),
        );
      },
    );
    if (_node != null) {
      expandAllNodes(rootNode!);
      await Future.delayed(const Duration(milliseconds: 800));

      controller!.scrollToItem(_node);
    }
  }
}
