import 'package:flutter/material.dart';
import 'package:mad/main.dart';

class NewsScreen extends StatefulWidget {

  String title;

  NewsScreen({super.key, required this.title});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {

    // print("Data in New route :  ${ModalRoute.of(context)?.settings.arguments}");
    //
    // final title = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title}"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
            Navigator.of(context).pop("news ABC");
        }, child: Text("Pop Method")),
      ),
    );
  }
}
