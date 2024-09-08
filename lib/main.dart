import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
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
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}