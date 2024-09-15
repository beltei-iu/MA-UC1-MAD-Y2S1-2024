
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mad/screens/main_screen.dart';
import 'package:mad/screens/news_screen.dart';
import 'package:mad/screens/splash_screen.dart';

class RouteGenerator {

  static const String splashScreen = "/";
  static const String mainScreen = "/mainScreen";
  static const String languageScreen = "/languageScreen";
  static const String newsScreen = "/newsScreen";

  static final key = GlobalKey<NavigatorState>();

  static Route<dynamic> onGenerateRoute(RouteSettings settings){

    switch(settings.name){
      case splashScreen:
        final route = MaterialPageRoute(builder: (BuildContext context) => SplashScreen());
        return route;
      case mainScreen:
        final route = MaterialPageRoute(builder: (BuildContext context) => MainScreen());
        return route;
      case newsScreen:
        final route = MaterialPageRoute(builder: (BuildContext context) => NewsScreen(title: "",));
        return route;
      default:
          throw RouteException("Route not found");
    }
  }

  static Route<dynamic> _createRoute(Widget newScreen){
    return MaterialPageRoute(builder: (BuildContext context) => newScreen);
  }
}

class RouteException implements Exception {

  String message;

  RouteException(this.message);
}