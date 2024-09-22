
import 'package:flutter/material.dart';
import 'package:mad/localize/app_localization.dart';
import 'package:mad/localize/app_localize_key.dart';
import 'package:mad/main.dart';
import 'package:mad/screens/class_screen.dart';
import 'package:mad/screens/home_screen.dart';
import 'package:mad/screens/more_screen.dart';

class MainScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<MainScreen> {

  int _indexSelected = 0;
  List<Widget> screenList = [
    HomeScreen(),
    ClassScreen(),
    MoreScreen()
  ];

  @override
  Widget build(BuildContext context) {

    List<BottomNavigationBarItem> myBottomNavigationBarItemList = [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: AppLocalization.of(context)!.translate(AppLocalizeKey.home)),
      BottomNavigationBarItem(icon: Icon(Icons.class_rounded), label: AppLocalization.of(context)!.translate(AppLocalizeKey.classroom)),
      BottomNavigationBarItem(icon: Icon(Icons.more_vert), label: AppLocalization.of(context)!.translate(AppLocalizeKey.more)),
    ];

    final mainScreen = Scaffold(
      body: screenList.elementAt(_indexSelected),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexSelected,
        items: myBottomNavigationBarItemList,
        onTap: (v){
          setState(() {
            _indexSelected = v;
          });
        },
        elevation: 5,
      ),
    );

    return mainScreen;
  }
}