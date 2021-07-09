import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './pages/firstScreen.dart';
import './pages/secondScreen.dart';
import './pages/thirdScreen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/' :
        return  MaterialPageRoute(
            builder: (_)=> HomeScreen()
        );
      case '/addStudent' :
        return MaterialPageRoute(
            builder: (_)=> AddStudent()
        ) ;
      case '/studentDetails' :
        return MaterialPageRoute(
            builder: (_)=> StudentDetails()
        ) ;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}