import 'package:flutter/material.dart';

class RootNodeWidget extends StatefulWidget {
  final String imgURL;
  final String name;
  final String desg;
  final bool isMobileView;
  const RootNodeWidget({
    Key? key,
    required this.imgURL,
    required this.name,
    required this.desg, required this.isMobileView,
  }) : super(key: key);

  @override
  _RootNodeWidgetState createState() => _RootNodeWidgetState();
}

class _RootNodeWidgetState extends State<RootNodeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: widget.isMobileView ? 98 : 118,
              width: 61,
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
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 8,
                top: 8,
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              height: widget.isMobileView ? 84 : 104,
              width: widget.isMobileView ? 84 : 104,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48.0),
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/person.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),

        Container(
          height: widget.isMobileView ? 65 : 75,
          width: widget.isMobileView ? 200 : 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            color: const Color(0xFFF2F2F2),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFEEEEEE),
                blurRadius: 4,
                offset: Offset(0, 4),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                widget.desg,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff2CA1AE),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
