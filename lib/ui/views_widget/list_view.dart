import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:organogram_2/models/node_kt.dart';
import 'package:organogram_2/models/org_node.dart';
import 'package:organogram_2/store/organogram_store.dart';
import 'package:organogram_2/ui/utils/widget/root_node.dart';
import 'package:organogram_2/ui/utils/widget/node_widget.dart';

class OrgListView extends StatefulWidget {
  final OrganogramStore organogramStore;
  final bool isDepartment;
  final bool isMobileView;
  final bool isTableView;
  const OrgListView(
      {Key? key,
      required this.organogramStore,
      required this.isDepartment,
      required this.isMobileView,
      required this.isTableView})
      : super(key: key);

  @override
  State<OrgListView> createState() => _OrgListViewState();
}

class _OrgListViewState extends State<OrgListView> {


  int nodeLevel = 1;

  Future<List<OrgNode>> getAllNodes() async {
    List<OrgNode> allNodes = [];
    allNodes.clear();
    Map<String, dynamic> _data = await rootBundle
        .loadString("assets/json/org_hierarchy.json")
        .then((jsonStr) => jsonDecode(jsonStr));
    KtNode _ktNode = KtNode.fromJson(_data);
    OrgNode _baseNode = OrgNode(person: _ktNode.person);
    allNodes.add(_baseNode);
    _generateTree(_ktNode, _baseNode, allNodes);
    allNodes.sort((node1, node2) => node1.level.compareTo(node2.level));
    await Future.delayed(const Duration(milliseconds: 800));
    return allNodes;
  }

  void _generateTree(KtNode jsonNode, OrgNode rootOrgNode, List<OrgNode> list) {
    for (KtNode jsonNode in jsonNode.children) {
      // ktNodes.add(KtNode(person: jsonNode.person, children: jsonNode.children));
      OrgNode _node = OrgNode(person: jsonNode.person);
      list.add(_node);
      rootOrgNode.add(_node);
      _generateTree(jsonNode, _node, list);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAllNodes(),
        builder: (context, AsyncSnapshot<List<OrgNode>> snapshot) {
          if (snapshot.hasData) {
            return Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomScrollView(
                      scrollDirection: Axis.vertical,
                      primary: true,
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        const SliverToBoxAdapter(
                          child: SizedBox(
                            height: 24,
                          ),
                        ),
                        widget.isDepartment
                            ? SliverToBoxAdapter(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Finanace Department",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      height: 42,
                                      width: 286,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0xFFB8B7B7)
                                                .withOpacity(0.10),
                                            spreadRadius: 2,
                                            blurRadius: 2,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: const Color(0xFFF2F2F2),
                                      ),
                                      child: const TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Search by Department",
                                          suffixIcon: Icon(Icons.search),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SliverToBoxAdapter(
                                child: SizedBox.shrink()),
                        widget.isDepartment
                            ? const SliverToBoxAdapter(
                                child: SizedBox(
                                  height: 5,
                                ),
                              )
                            : const SliverToBoxAdapter(
                                child: SizedBox.shrink()),
                        widget.isDepartment
                            ? const SliverToBoxAdapter(
                                child: Divider(
                                  color: Color(0xffECECEC),
                                ),
                              )
                            : const SliverToBoxAdapter(
                                child: SizedBox.shrink()),
                        SliverToBoxAdapter(
                          child: RootNodeWidget(
                            name: snapshot.data!.first.person!.name,
                            desg: snapshot.data!.first.person!.designation,
                            imgURL: snapshot.data!.first.person!.imageURL,
                            isMobileView: widget.isMobileView,
                          ),
                        ),
                        const SliverToBoxAdapter(
                          child: SizedBox(
                            height: 20,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: levelBorder("Faisal Ahmed"),
                        ),
                        const SliverToBoxAdapter(
                          child: SizedBox(
                            height: 10,
                          ),
                        ),
                        SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300.0,
                            mainAxisExtent: widget.isMobileView ? 80 : 110,
                            crossAxisSpacing: 12.0,
                            mainAxisSpacing: 12.0,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (child, index) {
                              if (snapshot.data!.isNotEmpty) {
                                return NodeWidget(
                                  personName:
                                      snapshot.data![index + 1].person!.name,
                                  desg: snapshot
                                      .data![index + 1].person!.designation,
                                  imgURL: snapshot
                                      .data![index + 1].person!.imageURL,
                                  isGridView: true,
                                  isMobileView: widget.isMobileView,
                                  item: snapshot.data![index + 1],
                                  organogramStore: widget.organogramStore,
                                );
                              } else {
                                return const Center(
                                  child: Text("No Data in List"),
                                );
                              }
                            },
                            childCount:
                                snapshot.data!.first.childrenAsList.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}

Widget levelBorder(String name) {
  return Column(
    children: [
      Container(
        height: 15,
        color: Colors.transparent,
        child: const Center(
          child: VerticalDivider(
            color: Colors.black,
            thickness: 4,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Container(
          height: 3,
          color: Colors.black,
        ),
      ),
      Container(
        height: 10,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            VerticalDivider(
              color: Colors.black,
              thickness: 4,
            ),
            VerticalDivider(
              color: Colors.black,
              thickness: 4,
            ),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          Row(
            children: const [
              Text("Collapse"),
              Icon(
                Icons.keyboard_arrow_up,
                color: Colors.black38,
              ),
            ],
          )
        ],
      ),
    ],
  );
}
