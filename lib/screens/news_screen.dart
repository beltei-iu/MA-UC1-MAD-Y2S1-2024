import 'package:flutter/material.dart';
import 'package:mad/main.dart';
import 'package:mad/model/data_route_arguments.dart';

class NewsScreen extends StatefulWidget {

  NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as DataRouteArguments;
    print("Data in New route :  ${args.title}");

    return Scaffold(
      appBar: AppBar(
        title: Text("${args.title}"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
            Navigator.of(context).pop("news ABC");
        }, child: Text("Pop Method")),
      ),
    );
  }
}
