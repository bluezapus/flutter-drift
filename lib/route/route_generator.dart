import 'package:flutter/material.dart';
import 'package:flutter_drift/pages/add_file.dart';
import 'package:flutter_drift/pages/home_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/add_file':
        return MaterialPageRoute(builder: (_) => AddFile());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'No Route',
          ),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            'Sorry no route was found!',
            style: TextStyle(
              color: Colors.red,
              fontSize: 18.0,
            ),
          ),
        ),
      );
    });
  }
}
