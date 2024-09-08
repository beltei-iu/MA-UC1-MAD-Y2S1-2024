import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {


    final notificationCheckBox = Card(
      child: ListTile(
        leading: Icon(Icons.notifications),
        title: Text("Notification"),
        trailing: Checkbox(value: false, onChanged: (v){}),
      ),
    );

    final languageItem = Card(
      child: ListTile(
        leading: Icon(Icons.language),
        title: Text("Language"),
        trailing: Icon(Icons.navigate_next),
      ),
    );


    final moreScreen = Scaffold(
      appBar: AppBar(
        title: Text("More"),
        centerTitle: true,
        elevation: 5,
      ),
      body: ListView(
        children: [
          notificationCheckBox,
          languageItem
        ],
      ),
    );

    return moreScreen;
  }
}
