import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  Future<Map<String,dynamic>> loadDataFromServer() async {
    String url = "https://jsonplaceholder.typicode.com/photos/1";
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      Future.delayed(Duration(minutes: 1));
      return data;
    }else{
      throw("Error API from Server");
    }
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: FutureBuilder(
            future: loadDataFromServer(),
            builder: (BuildContext context, AsyncSnapshot<Map<String,dynamic>> asyncSnapshot){
              if(asyncSnapshot.connectionState == ConnectionState.done){

                // Return Error
                if(asyncSnapshot.hasError){
                  return Center(
                    child: Text("${asyncSnapshot.error}"),
                  );
                }

                // No Error
                Map<String,dynamic> dataFromAPI = asyncSnapshot.data as Map<String, dynamic>;
                return Center(
                    child: Text("${dataFromAPI["title"]}"),
                  );
              }else{
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
    );
  }
}
