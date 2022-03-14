import 'dart:convert';
import 'dart:math';

import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/services.dart';
import 'package:organogram_2/models/entity.dart';
import 'package:organogram_2/models/node_kt.dart';
import 'package:organogram_2/models/org_node.dart';
import 'package:organogram_2/store/organogram_store.dart';

Future<OrgNode> parseJsonFromAssets(OrganogramStore organogramStore) async {
  OrgNode? rootNode = OrgNode(
    person: const Entity(
      name: "Kitopi Org Chart",
      designation: "",
      imageURL: "",
    ),
  );
  Map<String, dynamic> _data = await rootBundle
      .loadString("assets/json/org_hierarchy.json")
      .then((jsonStr) => jsonDecode(jsonStr));
  KtNode? _ktNode = KtNode.fromJson(_data);
  OrgNode? _baseNode = OrgNode(person: _ktNode.person);
  organogramStore.maxLevel = _baseNode.level;
  rootNode.add(_baseNode);
  _generateTree(_ktNode, _baseNode, organogramStore);
  await Future.delayed(const Duration(milliseconds: 200));
  return rootNode;
}

void _generateTree(
    KtNode? jsonNode, OrgNode? rootOrgNode, OrganogramStore organogramStore) {
  for (KtNode jsonNode in jsonNode!.children) {
    OrgNode _node = OrgNode(person: jsonNode.person);
    rootOrgNode!.add(_node);
    organogramStore.maxLevel = max(_node.level, organogramStore.maxLevel);
    _generateTree(jsonNode, _node, organogramStore);
  }
}

void expandAllNodes(OrgNode rootOrgNode,TreeViewController<OrgNode> controller) async {
    // rootOrgNode.meta!.clear();
    for (var element in rootOrgNode.childrenAsList) {
        if (rootOrgNode.childrenAsList.isNotEmpty &&
            (element.meta == null || element.meta!.containsValue(false))) {
          controller.toggleNodeExpandCollapse(element as OrgNode);
        }
        expandAllNodes(element as OrgNode, controller);
      }
  }

