import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organogram_2/models/org_node.dart';
import 'package:organogram_2/store/organogram_store.dart';
import 'package:organogram_2/ui/desktop/OrgChart/org_chart.dart';
import 'package:organogram_2/ui/desktop/byDepartment/by_department.dart';
import 'package:organogram_2/ui/utils/widget/menu.dart';

class MobileView extends StatefulWidget {
  final OrganogramStore organogramStore;
  const MobileView({Key? key, required this.organogramStore}) : super(key: key);

  @override
  _MobileViewState createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  bool selected = false;
  final TreeViewController<OrgNode> controller = TreeViewController<OrgNode>();
  final _advanceDrawerController = AdvancedDrawerController();

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advanceDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return AdvancedDrawer(
        openRatio: 0.35,
        controller: _advanceDrawerController,
        animationCurve: Curves.easeInOutCirc,
        animateChildDecoration: true,
        rtlOpening: false,
        disabledGestures: false,
        animationDuration: const Duration(milliseconds: 300),
        drawer: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width / 2,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF2EA5B2),
                Color(0xFF76EEFC),
              ],
              begin: Alignment.topCenter,
              end: AlignmentDirectional.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 64.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 64.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Image.asset(
                  'assets/images/Kitopi-Logo.png',
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.home),
                title: const Text(
                  'Organzation Chart',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.account_circle_rounded),
                title: const Text(
                  'By Department',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: const Text(
                "Kitopi",
                style: TextStyle(
                  color: Color(0xff2CA1AE),
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Drawer(
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    )),
              ),
              actions: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(48.0),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/Profle.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            body: Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: PageTransitionSwitcher(
                        reverse: false,
                        transitionBuilder: (Widget child1,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return SharedAxisTransition(
                            fillColor: Colors.transparent,
                            animation: animation,
                            secondaryAnimation: secondaryAnimation,
                            transitionType: SharedAxisTransitionType.vertical,
                            child: child1,
                          );
                        },
                        child: Container(
                            margin: const EdgeInsets.only(top: 10.0, left: 16),
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16),
                                topLeft: Radius.circular(16),
                              ),
                            ),
                            child: getView(widget.organogramStore.indexView)),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      );
    });
  }

  Widget getView(int _index) {
    switch (_index) {
      case 0:
        return OrgChart(
          organogramStore: widget.organogramStore,
          isMobileView: true,
          isTableView: false,
        );
      case 1:
        return ByDepartment(
          organogramStore: widget.organogramStore,
          isMobileView: true,
          isTableView: false,
        );
      default:
        return OrgChart(
          organogramStore: widget.organogramStore,
          isMobileView: true,
          isTableView: false,
        );
    }
  }
}
