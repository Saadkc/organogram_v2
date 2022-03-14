import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/material.dart';
import 'package:organogram_2/models/org_node.dart';
import 'package:organogram_2/store/organogram_store.dart';
import 'package:organogram_2/ui/helper/custom_search.dart';

class Header extends StatefulWidget {
  final OrganogramStore organogramStore;
  
  const Header({Key? key, required this.organogramStore}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFB8B7B7).withOpacity(0.10),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32.0,
          vertical: 4.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 36,
                  width: 187,
                  child: Image.asset(
                    "assets/images/Kitopi-Logo.png",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 80),
                InkWell(
                  onTap: () async {
                   
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 42,
                    width: 326,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFB8B7B7).withOpacity(0.10),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xFFF2F2F2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                         Text("Search"),
                         Icon(Icons.search_outlined)
                
                      ],
                    ),
                   
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 63,
                  width: 63,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(48.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/person.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SearchOrgNode extends NodeSearchDelegate {
  final OrgNode? node;
  List<OrgNode> allNodes = [];
  SearchOrgNode({required this.node});

  Future<List<OrgNode>> getAllList(OrgNode _node) async {
    allNodes.clear();
    _getDeepChildNodes(_node);
    await Future.delayed(Duration(milliseconds: 200));
    return allNodes;
  }

  void _getDeepChildNodes(OrgNode rootOrgNode) {
    rootOrgNode.childrenAsList.forEach(
      (element) {
        allNodes.add(element as OrgNode);
        _getDeepChildNodes(element);
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {}

  @override
  Widget? buildLeading(BuildContext context) {
    return CloseButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<OrgNode>>(
      future: getAllList(node as OrgNode),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<OrgNode> _result = snapshot.data!.where(
            (element) {
              return element.person!.name.toLowerCase().contains(
                    query.toLowerCase(),
                  );
            },
          ).toList();
          if (_result.isNotEmpty) {
            return ListView(
              children: _result.map((item) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(item.person!.name),
                      subtitle: Text(item.person!.designation),
                      leading: ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.circular(90),
                        child: SizedBox(
                          height: 44,
                          width: 44,
                          child: Image.network(
                            item.person!.imageURL,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 14,
                      ),
                      onTap: () {
                        close(context, item);
                      },
                    ),
                    Divider(
                      height: 1,
                    )
                  ],
                );
              }).toList(),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_off_rounded,
                    size: 72,
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "No match found,\ntry searching someone else...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            );
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<OrgNode>>(
      future: getAllList(node as OrgNode),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<OrgNode> _result = snapshot.data!.where(
            (element) {
              return element.person!.name.toLowerCase().contains(
                    query.toLowerCase(),
                  );
            },
          ).toList();
          if (_result.isNotEmpty) {
            return ListView(
              children: _result.map((item) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(item.person!.name),
                      subtitle: Text(item.person!.designation),
                      leading: ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.circular(90),
                        child: SizedBox(
                          height: 44,
                          width: 44,
                          child: Image.network(
                            item.person!.imageURL,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 14,
                      ),
                      onTap: () {
                        close(context, item);
                      },
                    ),
                    Divider(
                      height: 1,
                    )
                  ],
                );
              }).toList(),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_off_rounded,
                    size: 72,
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "No match found,\ntry searching someone else...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            );
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
