import 'package:flutter/material.dart';
import 'package:organogram_2/app/routes.dart';

GlobalKey<NavigatorState>? navigatorKey = GlobalKey();

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Organogram",
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      onGenerateRoute: generateRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffF9F9F9),
        primarySwatch: Colors.teal,
        highlightColor: Colors.transparent,
        fontFamily: "GoogleSans",
        splashFactory: InkRipple.splashFactory,
        shadowColor: Colors.black26,
      ),
    );
  }
}
