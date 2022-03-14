import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/material.dart';
import 'package:organogram_2/models/org_node.dart';
import 'package:organogram_2/store/organogram_store.dart';
import 'package:organogram_2/ui/views_widget/list_view.dart';
class OrgChart extends StatefulWidget {
  final OrganogramStore organogramStore;
  final bool isMobileView;
  final bool isTableView;
  const OrgChart(
      {Key? key,
      required this.organogramStore,
      required this.isMobileView,
      required this.isTableView})
      : super(key: key);

  @override
  _OrgChartState createState() => _OrgChartState();
}

class _OrgChartState extends State<OrgChart> {
  final TreeViewController<OrgNode> controller = TreeViewController<OrgNode>();

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        scrollbars: false,
      ),
      child:
      //  Observer(builder: (context) {
      //   return
         Column(
          children: [
            OrgListView(
              organogramStore: widget.organogramStore,
              isDepartment: false,
              isMobileView: widget.isMobileView,
              isTableView: widget.isTableView,
            ),
            // CustomTabBar(
            //   organogramStore: widget.organogramStore,
            //   isMobileView: widget.isMobileView,
            //   isTabletView: widget.isTableView,
            // ),
            // getupdatedView(widget.organogramStore.selected, widget.isMobileView,
            //     widget.isTableView),
          ],
        ),
      // }),
    );
  }

  // Widget getupdatedView(bool view, bool isMobileView, bool isTableView) {
  //   switch (view) {
  //     case true:
  //       return OrgTreeView(
  //         store: widget.organogramStore,
  //         isMobileView: isMobileView,
  //         isTableView: isTableView,
  //       );
  //     case false:
  //       return OrgListView(
  //         organogramStore: widget.organogramStore,
  //         isDepartment: false,
  //         isMobileView: isMobileView,
  //         isTableView: isTableView,
  //       );
  //     default:
  //       return Container();
  //   }
  // }
}
