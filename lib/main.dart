import 'package:flutter/material.dart';
import 'package:mad/db/db_helper.dart';
import 'package:mad/routes.dart';
import 'package:mad/screens/article_screen.dart';
import 'package:mad/screens/main_screen.dart';
import 'package:mad/screens/product_screen.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.instance.database;
  runApp(App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'AMAD',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF018AAA)),
          useMaterial3: false,
          primaryColor: const Color(0xFF018AAA)
      ),

      // Method 1
      //home: SplashScreen(),

      // Method 2
      initialRoute: RouteGenerator.splashScreen,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      navigatorKey: RouteGenerator.key,

      // Method 3
      // routes: {
      //   '/': (context) => SplashScreen(),
      //   '/mainScreen' : (context) => MainScreen()
      // },
      debugShowCheckedModeBanner: false,
    );
  }
}