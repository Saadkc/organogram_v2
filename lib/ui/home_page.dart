import 'package:flutter/material.dart';
import 'package:organogram_2/store/organogram_store.dart';
import 'package:organogram_2/ui/desktop/desktop_view.dart';
import 'package:organogram_2/ui/helper/responsive.dart';
import 'package:organogram_2/ui/mobile/mobile_view.dart';
import 'package:organogram_2/ui/tablet/tablet_view.dart';

class HomePage extends StatefulWidget {
  static const String route = "/";
  const HomePage({
    Key? key,
    required this.organogramStore,
  }) : super(key: key);

  final OrganogramStore organogramStore;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final OrganogramStore organogramStore = OrganogramStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        mobile: MobileView(
          organogramStore: organogramStore,
        ),
        tablet: TabletView(
          organogramStore: organogramStore,
        ),
        desktop: DesktopView(
          organogramStore: organogramStore,
        ),
      ),
    );
  }
}
