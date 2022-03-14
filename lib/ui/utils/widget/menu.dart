import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organogram_2/store/organogram_store.dart';

class MenuWidget extends StatefulWidget {
  final OrganogramStore organogramStore;
  const MenuWidget({Key? key, required this.organogramStore}) : super(key: key);

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 277,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff2EA5B2),
            Color(0xff76EEFC),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            top: widget.organogramStore.indexView == 0 ? 178 : 234,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOutCirc,
            child: SvgPicture.asset(
              "assets/images/menu_bar_bg.svg",
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 160),
              const Text(
                "Organogram",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  letterSpacing: 1  ,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              MenuButton(
                iconData: Icons.home,
                index: 0,
                title: 'Organization Chart',
                organogramStore: widget.organogramStore,
              ),
              MenuButton(
                iconData: Icons.bar_chart,
                index: 1,
                title: 'By Department',
                organogramStore: widget.organogramStore,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatefulWidget {
  const MenuButton({
    Key? key,
    required this.iconData,
    required this.title,
    required this.index,
    required this.organogramStore,
  }) : super(key: key);

  final IconData iconData;
  final String title;
  final int index;
  final OrganogramStore organogramStore;

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          child: InkWell(
            onTap: () {
              widget.organogramStore.setIndexView(widget.index);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 40,
                  height: 44,
                ),
                AnimatedSwitcher(
                  switchInCurve: Curves.ease,
                  switchOutCurve: Curves.ease,
                  duration: const Duration(milliseconds: 300),
                  child: widget.organogramStore.indexView == widget.index
                      ? Icon(
                          widget.iconData,
                          key: const ValueKey("Selected"),
                          size: 27,
                          color: Colors.cyan,
                        )
                      : Icon(
                          widget.iconData,
                          key: const ValueKey("unSelected"),
                          size: 27,
                          color: Colors.white70,
                        ),
                ),
                const SizedBox(width: 12),
                AnimatedDefaultTextStyle(
                  curve: Curves.ease,
                  duration: const Duration(milliseconds: 300),
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: widget.organogramStore.indexView == widget.index
                        ? Colors.cyan
                        : Colors.white70,
                  ),
                  child: Text(
                    widget.title,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
