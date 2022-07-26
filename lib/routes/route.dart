import 'package:flutter/material.dart';
import 'package:get_rest_api/Homepage.dart';
import 'package:get_rest_api/LoginScreen.dart';
import 'package:get_rest_api/Register.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => Homepage());
      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
      case '/daftar':
        return MaterialPageRoute(builder: (_) => Register());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text("Error")),
        body: Center(child: Text('Error page')),
      );
    });
  }
}