import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uts_maktab/screens/Home%20Page/home_page.dart';

import 'screens/Home Page/home_page.dart';

class RouteServices {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case "/homepage":
        return CupertinoPageRoute(builder: (_) => const MyHomePage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Page Not Found'),
        ),
      ),
    );
  }
}
