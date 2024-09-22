
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mad/screens/account_screen.dart';
import 'package:mad/screens/login_screen.dart';
import 'package:mad/screens/main_screen.dart';
import 'package:mad/screens/news_screen.dart';
import 'package:mad/screens/register_screen.dart';
import 'package:mad/screens/splash_screen.dart';

import 'model/data_route_arguments.dart';

class RouteGenerator {

  static const String splashScreen = "/";
  static const String mainScreen = "/mainScreen";
  static const String languageScreen = "/languageScreen";
  static const String newsScreen = "/newsScreen";

  static const String registerScreen = "/registerScreen";
  static const String loginScreen = "/loginScreen";
  static const String accountScreen = "/accountScreen";

  static final key = GlobalKey<NavigatorState>();

  static Route<dynamic> onGenerateRoute(RouteSettings settings){

    switch(settings.name){
      case splashScreen:
        return _createRoute(SplashScreen(), settings);
      case mainScreen:
        return _createRoute(MainScreen(), settings);
      case newsScreen:
        return _createRoute(NewsScreen(), settings);
      case loginScreen:
        return _createRoute(LoginScreen(), settings);
      case registerScreen:
        return _createRoute(RegisterScreen(), settings);
      case accountScreen:
        return _createRoute(AccountScreen(), settings);
        default:
          throw RouteException("Route not found");
    }
  }

  static Route<dynamic> _createRoute(Widget newScreen, RouteSettings settings){
    return MaterialPageRoute(settings: settings, builder: (BuildContext context) => newScreen);
  }
}

class RouteException implements Exception {

  String message;

  RouteException(this.message);
}