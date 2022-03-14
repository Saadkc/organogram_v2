import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:organogram_2/store/organogram_store.dart';

class CustomTabBar extends StatefulWidget {
  final OrganogramStore organogramStore;
  final bool isMobileView;
  final bool isTabletView;
  const CustomTabBar({Key? key, required this.organogramStore, required this.isMobileView, required this.isTabletView})
      : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical:24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: widget.isMobileView ? 55 : widget.isTabletView ? 55 : 45,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.grey.shade200,
              ),
              child: Stack(
                children: [
                  AnimatedAlign(
                    alignment: widget.organogramStore.selected
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        // color: Colors.cyan,
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff2FA6B3),
                            Color(0xff75EDFB),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          
                          widget.organogramStore.setSelected(true);
                        },
                        child: Container(
                          width: 150,
                          color: Colors.transparent,
                          child: Center(
                            child: AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.fastOutSlowIn,
                              style: TextStyle(
                                color: widget.organogramStore.selected
                                    ? Colors.white
                                    : Colors.cyan,
                              ),
                              child: const Text(
                                "Tree View",
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.organogramStore.setSelected(false);
                        },
                        child: Container(
                          width: 150,
                          color: Colors.transparent,
                          child: Center(
                            child: AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.fastOutSlowIn,
                              style: TextStyle(
                                color: widget.organogramStore.selected
                                    ? Colors.cyan
                                    : Colors.white,
                              ),
                              child: const Text(
                                "List View",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
