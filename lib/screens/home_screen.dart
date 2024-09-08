
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    final homeScreen = Scaffold(
      appBar: AppBar(
        // title: Image.asset("assets/images/BELTEI_international_university_logo.png"),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/beltei_iu_logo.png",
              height: 50,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("សាកលវិទ្យាល័យ ប៊ែលធី អន្តរជាតិ"),
                Text("BELTEI International University", style: TextStyle(fontSize: 14),)
              ],
            ),
            SizedBox(height: 2,)
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          )
        ],
      ),
      body: ListView(
        children: [
          _buildLanguage,
          _appSloganWidget,
          _menuWidget
        ],
      ),
    );

    return homeScreen;
  }

  Widget get _buildLanguage {
    final khmerFlag = Padding(
      padding: const EdgeInsets.only(right: 2),
      child: Image.asset("assets/images/khmer.png", width: 40, height: 100,),
    );
    final englishFlag = Padding(
      padding: const EdgeInsets.only(right: 2),
      child: Image.asset("assets/images/english.png", width: 40,height: 100,),
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          khmerFlag,
          englishFlag
        ],
      ),
    );
  }

  Widget get _appSloganWidget {

    final textSlogan = Text("អនាគតភាពជាអ្នកដឹកនាំ",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
    );

    final msgSlogan = Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: Center(child: textSlogan),
      color: const Color(0xFF018AAA),
    );
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        msgSlogan
      ],
    );
  }

  Widget _cardMenu(String name,{Icon? icon }){
    return Container(
      width: MediaQuery.of(context).size.width /4 ,
      child: Card(
        elevation: 4,
        child: Center(child: Text(name)),
      ),
    );
  }

  Widget get _menuWidget {
    final row1 = Row(
      children: [
        _cardMenu("ព័ត៏មាន"),
      ],
    );

    final row2 = Row(
      children: [
        Text("Test Row 2")

      ],
    );

    final row3 = Row(
      children: [
        Text("Test Row 3")

      ],
    );

    return Column(
      children: [
        row1,
        // row2,
        // row3
      ],
    );
  }

}
