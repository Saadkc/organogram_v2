import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:organogram_2/models/org_node.dart';
import 'package:organogram_2/store/organogram_store.dart';

class NodeWidget extends StatefulWidget {
  final String imgURL;
  final String personName;
  final String desg;
  final Color? color;
  final OrgNode? item;
  final bool isGridView;
  final bool? isMobileView;
  final bool? isTabletView;
  final TreeViewController<OrgNode>? controller;
  final OrganogramStore organogramStore;

  const NodeWidget({
    Key? key,
    required this.imgURL,
    required this.personName,
    required this.desg,
    this.color,
    this.item,
    required this.isGridView,
    this.isMobileView,
    this.isTabletView,
    this.controller,
    required this.organogramStore,
  }) : super(key: key);

  @override
  _NodeWidgetState createState() => _NodeWidgetState();
}

class _NodeWidgetState extends State<NodeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        children: [
          Container(
            
            height: widget.isMobileView! ? 78 : 90,
            width: widget.isMobileView!
                ? widget.isGridView
                    ? 40
                    : 45
                : 61,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff299FAC),
                  Color(0xFF6AE2F0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(80),
                bottomLeft: Radius.circular(80),
              ),
              color: Color(0xff279DAA),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: widget.isMobileView!
                  ? widget.isGridView
                      ? 6
                      : 8
                  : 8,
              top: widget.isMobileView!
                  ? widget.isGridView
                      ? 4.5
                      : 8
                  : 8,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            height: widget.isMobileView!
                ? widget.isGridView
                    ? 55
                    : 62
                : 73,
            width: widget.isMobileView!
                ? widget.isGridView
                    ? 200
                    : 230
                : 280,
            decoration: BoxDecoration(
              color: const Color(0xffF2F2F2),
              borderRadius: BorderRadius.circular(48.0),
              // border: Border.all(),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFB8B7B7).withOpacity(0.10),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  height: widget.isMobileView!
                      ? widget.isGridView
                          ? 61
                          : 71
                      : 81,
                  width: widget.isMobileView!
                      ? widget.isGridView
                          ? 48
                          : 58
                      : 61,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(48.0),
                    border: Border.all(
                      width: 4,
                      color: const Color(0xff279DAA),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(widget.imgURL),
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                        isAntiAlias: true),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.personName,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: widget.isMobileView!
                            ? widget.isGridView
                                ? 10
                                : 12
                            : 16,
                      ),
                    ),
                    Text(
                      widget.desg,
                      style: TextStyle(
                        color: const Color(0xff279DAA),
                        fontSize: widget.isMobileView!
                            ? widget.isGridView
                                ? 8
                                : 10
                            : 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          widget.isGridView
              ? const SizedBox.shrink()
              : Container(
                  margin: EdgeInsets.only(
                      left: widget.isMobileView! ? 200 : 240,
                      top: widget.isMobileView! ? 25 : 30),
                  child: widget.item!.children.isNotEmpty
                      ? const Icon(Icons.arrow_drop_down, color: Colors.black)
                      : const SizedBox.shrink(),
                ),
          // SizedBox(
          //   height: 100,
          //   width: 300,
          //   child: Material(
          //     color: Colors.transparent,
          //     child: InkWell(
          //         splashColor: Colors.transparent,
          //         highlightColor: Colors.transparent,
          //         focusColor: Colors.transparent,
          //         hoverColor: Colors.transparent,
          //         onTap: () {
          //           if (widget.isGridView == true) {
          //             widget.organogramStore.selectedNode = widget.item;
          //           } else {
          //             widget.controller!.toggleNodeExpandCollapse(widget.item!);
          //             widget.organogramStore.selectedNode = widget.item;
          //           }
          //         }),
          //   ),
          // ),
        ],
      ),
    );
  }
}
