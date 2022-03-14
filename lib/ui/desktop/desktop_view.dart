import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:organogram_2/store/organogram_store.dart';
import 'package:organogram_2/ui/desktop/OrgChart/org_chart.dart';
import 'package:organogram_2/ui/desktop/byDepartment/by_department.dart';
import 'package:organogram_2/ui/utils/widget/header.dart';
import 'package:organogram_2/ui/utils/widget/menu.dart';
import 'package:organogram_2/ui/utils/widget/side_panel.dart';

class DesktopView extends StatefulWidget {
  final OrganogramStore organogramStore;
  const DesktopView({
    Key? key,
    required this.organogramStore,
  }) : super(key: key);

  @override
  _DesktopViewState createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        body: Stack(
          children: [
            Row(
              children: [
                MenuWidget(
                  organogramStore: widget.organogramStore,
                ),
                Expanded(
                  flex: 12,
                  child: 
                  PageTransitionSwitcher(
                    reverse: false,
                    transitionBuilder: (Widget child,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return SharedAxisTransition(
                        fillColor: Colors.transparent,
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: SharedAxisTransitionType.vertical,
                        child: child,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 86.0, left: 16),
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          topLeft: Radius.circular(16),
                        ),
                      ),
                      child: getView(widget.organogramStore.indexView),
                    ),
                  ),
                ),
                Expanded(
                  child: SidePanelWidget(selectedNode: widget.organogramStore.selectedNode,),
                  flex: 5,
                )
              ],
            ),
             Header(organogramStore: widget.organogramStore,),
          ],
        ),
      );
    });
  }

  Widget getView(int _index) {
    switch (_index) {
      case 0:
        return OrgChart(
          organogramStore: widget.organogramStore,
          isMobileView: false,
          isTableView: false,
        );
      case 1:
        return ByDepartment(
          organogramStore: widget.organogramStore,
          isMobileView: false,
          isTableView: false,
        );
      default:
        return OrgChart(
          organogramStore: widget.organogramStore,
          isMobileView: false,
          isTableView: false,
        );
    }
  }
}
