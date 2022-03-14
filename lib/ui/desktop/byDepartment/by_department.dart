import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:organogram_2/store/organogram_store.dart';
import 'package:organogram_2/ui/views_widget/tree_vew.dart';
import 'package:organogram_2/ui/views_widget/list_view.dart';

import '../../custom_tabbar.dart';

class ByDepartment extends StatefulWidget {
  final OrganogramStore organogramStore;
  final bool isMobileView;
  final bool isTableView;
  const ByDepartment(
      {Key? key,
      required this.organogramStore,
      required this.isMobileView,
      required this.isTableView})
      : super(key: key);

  @override
  _ByDepartmentState createState() => _ByDepartmentState();
}

class _ByDepartmentState extends State<ByDepartment> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        scrollbars: false,
      ),
      child: Observer(builder: (context) {
        return Column(
          children: [
            CustomTabBar(
              organogramStore: widget.organogramStore,
              isMobileView: widget.isMobileView,
              isTabletView: widget.isTableView,
            ),
            getupdatedView(
              widget.organogramStore.selected,
            ),
          ],
        );
      }),
    );
  }

  Widget getupdatedView(
    bool view,
  ) {
    switch (view) {
      case true:
        return OrgTreeView(
            store: widget.organogramStore,
            isTableView: widget.isTableView,
            isMobileView: widget.isMobileView);
      case false:
        return OrgListView(
          organogramStore: widget.organogramStore,
          isDepartment: true,
          isMobileView: widget.isMobileView,
          isTableView: widget.isTableView
        );
      default:
        return Container();
    }
  }
}
