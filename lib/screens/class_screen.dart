import 'package:flutter/material.dart';
import 'package:mad/main.dart';

class ClassScreen extends StatefulWidget {
  const ClassScreen({super.key});

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  @override
  Widget build(BuildContext context) {

    final classScreen = Scaffold(
      appBar: AppBar(
        title: Text("Class"),
        elevation: 5,
      ),
      body: Center(
        child: Text("Class Screen"),
      ),
    );

    return classScreen;
  }
}
