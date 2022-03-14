import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:organogram_2/models/org_node.dart';
import 'package:organogram_2/store/organogram_store.dart';
import 'package:organogram_2/ui/views_widget/tree_vew.dart';

class SidePanelWidget extends StatefulWidget {
    final OrgNode? selectedNode;
  const SidePanelWidget({Key? key, required this.selectedNode}) : super(key: key);

  @override
  _SidePanelWidgetState createState() => _SidePanelWidgetState();
}

class _SidePanelWidgetState extends State<SidePanelWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 110,
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 36),
            child: Text(
              "More Info",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color(0xff43BAC7)),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 15,
          ),
        ),
        const SliverToBoxAdapter(
          child: PersonDetailWidget(
            imgURL: "assets/images/person.png",
            name: "Faisal. K",
            dept: "CEO",
            detail:
                "orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever ",
          ),
        ),
        const SliverToBoxAdapter(
          child: BasicInfoWidget(
            dept: "Head Of Organization",
            location: "Dubai",
          ),
        ),
        SliverToBoxAdapter(
          child: HierarchyTile(
            node: widget.selectedNode,
          ),
        ),
        // SliverToBoxAdapter(
        //   child: Column(children: const [
        //     SubordinatesWidget(),
        //   ]),
        // )
      ],
    );
  }
}

class PersonDetailWidget extends StatefulWidget {
  final String imgURL;
  final String name;
  final String dept;
  final String detail;
  const PersonDetailWidget({
    Key? key,
    required this.imgURL,
    required this.name,
    required this.dept,
    required this.detail,
  }) : super(key: key);

  @override
  _PersonDetailWidgetState createState() => _PersonDetailWidgetState();
}

class _PersonDetailWidgetState extends State<PersonDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
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
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 105,
                width: 105,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(48.0),
                  image: DecorationImage(
                    image: AssetImage(widget.imgURL),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    widget.dept,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            widget.detail,
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 11),
          )
        ],
      ),
    );
  }
}

class BasicInfoWidget extends StatefulWidget {
  final String dept;
  final String location;
  const BasicInfoWidget({
    Key? key,
    required this.dept,
    required this.location,
  }) : super(key: key);

  @override
  _BasicInfoWidgetState createState() => _BasicInfoWidgetState();
}

class _BasicInfoWidgetState extends State<BasicInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFB8B7B7).withOpacity(0.10),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/Kitopi-Logo.png"),
          const SizedBox(height: 8),
          const Text(
            "Department",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.dept,
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 8),
          const Text(
            "Location",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.location,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class SubordinatesWidget extends StatefulWidget {
  const SubordinatesWidget({
    Key? key,
  }) : super(key: key);
  @override
  _SubordinatesWidgetState createState() => _SubordinatesWidgetState();
}

class _SubordinatesWidgetState extends State<SubordinatesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFB8B7B7).withOpacity(0.10),
            spreadRadius: 7,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 8),
          Text(
            "Direct Subordinates",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 20),
          PersonWidget(
            imgURL: "assets/images/person.png",
            name: "John .D",
            designation: "Manager",
          ),
          SizedBox(height: 4),
          PersonWidget(
            imgURL: "assets/images/person.png",
            name: "Mike",
            designation: "Co-Manager",
          ),
          SizedBox(height: 4),
          PersonWidget(
            imgURL: "assets/images/person.png",
            name: "Linc",
            designation: "Employee",
          ),
          SizedBox(height: 4),
          PersonWidget(
            imgURL: "assets/images/person.png",
            name: "name",
            designation: "designation",
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}

class HierarchyTile extends StatefulWidget {
  final OrgNode? node;
  final Color? bgColor;

  const HierarchyTile({Key? key, this.node, this.bgColor}) : super(key: key);
  @override
  _HierarchyTileState createState() => _HierarchyTileState();
}

class _HierarchyTileState extends State<HierarchyTile> {
  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      reverse: false,
      transitionBuilder: (Widget child1, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return SharedAxisTransition(
          fillColor: Colors.transparent,
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.vertical,
          child: child1,
        );
      },
      child: widget.node != null && widget.node!.childrenAsList.isNotEmpty
          ? Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: widget.bgColor ?? Colors.grey.shade50,
                // border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Direct Subordinates",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Divider(height: 28, indent: 12.0, endIndent: 12),
                  Column(
                      children: widget.node!.childrenAsList.map(
                    (item) {
                      OrgNode myNode = item as OrgNode;
                      return PersonWidget(
                        imgURL: myNode.person!.imageURL,
                        name: myNode.person!.name,
                        designation: myNode.person!.designation,
                      );
                    },
                  ).toList()),
                  const SizedBox(height: 10),
                ],
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}

class PersonWidget extends StatefulWidget {
  final String imgURL;
  final String name;
  final String designation;

  const PersonWidget({
    Key? key,
    required this.imgURL,
    required this.name,
    required this.designation,
  }) : super(key: key);
  @override
  _PersonWidgetState createState() => _PersonWidgetState();
}

class _PersonWidgetState extends State<PersonWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                48.0,
              ),
              image: DecorationImage(
                image: NetworkImage(widget.imgURL),
                fit: BoxFit.cover,
              )),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              widget.designation,
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
