import 'package:flutter/material.dart';
import 'package:organogram_2/store/organogram_store.dart';
import 'package:organogram_2/ui/home_page.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomePage.route:
      return MaterialPageRoute(
        builder: (context) => HomePage(
          organogramStore: OrganogramStore(),
        ),
      );
    // case HomeScreen.route:
    //   return MaterialPageRoute(
    //     builder: (context) => const HomeScreen(),
    //   );
    default:
      return MaterialPageRoute(
        builder: (context) => Container(),
      );
  }
}
