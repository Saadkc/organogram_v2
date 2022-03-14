import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:organogram_2/models/org_node.dart';
import 'package:organogram_2/store/organogram_store.dart';
import 'package:organogram_2/ui/utils/widget/node_widget.dart';

class OrgTreeView extends StatefulWidget {
  final OrganogramStore store;
  final bool isMobileView;
  final bool isTableView;
  const OrgTreeView({
    Key? key,
    required this.store,
    required this.isMobileView,
    required this.isTableView,
  }) : super(key: key);

  @override
  State<OrgTreeView> createState() => _OrgTreeViewState();
}

class _OrgTreeViewState extends State<OrgTreeView> {
  late AutoScrollController scrollController;
  // TreeViewController<OrgNode> controller = TreeViewController<OrgNode>();
  double indentPadding = 48;

  @override
  void initState() {
    scrollController = AutoScrollController();
    widget.store.controller = TreeViewController<OrgNode>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          CustomScrollView(
            scrollDirection: Axis.horizontal,
            primary: true,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  width: widget.isTableView
                      ? MediaQuery.of(context).size.width / 3 +
                          widget.store.maxLevel * indentPadding
                      : MediaQuery.of(context).size.width / 4 +
                          widget.store.maxLevel * indentPadding,
                  child: TreeView<OrgNode>(
                    // scrollController: scrollController,
                    indentPadding: indentPadding,
                    // primary: false,
                    onItemTap: null,
                    initialItem: widget.store.rootNode,
                    controller: widget.store.controller,
                    scrollController: scrollController,
                    padding: const EdgeInsets.only(left: 12),
                    expansionBehavior: ExpansionBehavior.none,
                    showRootNode: false,
                    shrinkWrap: false,
                    // physics: const NeverScrollableScrollPhysics(),
                    expansionIndicator: null,

                    builder: (context, level, item) => widget.isMobileView
                        ? NodeWidget(
                            personName: item.person!.name,
                            desg: item.person!.designation,
                            imgURL: item.person!.imageURL,
                            item: item,
                            isGridView: false,
                            isMobileView: widget.isMobileView,
                            isTabletView: widget.isTableView,
                            controller: widget.store.controller,
                            organogramStore: widget.store,
                          )
                        : Center(
                            child: NodeWidget(
                              personName: item.person!.name,
                              desg: item.person!.designation,
                              imgURL: item.person!.imageURL,
                              item: item,
                              isGridView: false,
                              isMobileView: widget.isMobileView,
                              isTabletView: widget.isTableView,
                              controller: widget.store.controller,
                              organogramStore: widget.store,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
