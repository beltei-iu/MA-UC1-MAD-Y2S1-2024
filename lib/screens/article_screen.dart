import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ArticleScreen extends StatefulWidget {

  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {

  StreamController<int> _streamController = StreamController<int>();
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _startStream();
  }

  void _startStream() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      _counter++;
      // Add new data to the stream
      _streamController.add(_counter);
      if (_counter >= 100) {
        timer.cancel();
        // Close stream after counter reaches 10
        _streamController.close();
      }
    });
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }


  //
  // Stream<double> randomNumberStream() async* {
  //    var random = Random();
  //    while(true){
  //      Future.delayed(Duration(seconds: 10));
  //      yield random.nextDouble();
  //    }
  // }
  //
  // StreamController<double> controller = StreamController<double>();
  //
  // double _data = 0;
  //
  // late Stream<int> _myStream;
  //
  // Stream<int> _createStream() async* {
  //   var random = Random();
  //   while{
  //     await Future.delayed(Duration(seconds: 1));
  //     yield random.nextInt(10); // Emits the current count
  //   }
  // }



  @override
  Widget build(BuildContext context) {
    // Listen
    // randomNumberStream().listen((value) {
    //   print('$value');
    //   setState(() {
    //     _data = value;
    //   });
    // });



    // return Scaffold(
    //   body: Center(
    //     child: Text("Data : $_data"),
    //   ),
    // );

    // return Scaffold(
    //   body: StreamBuilder(
    //       stream: _myStream,
    //       builder: (BuildContext context, AsyncSnapshot<int> asyncSnapshot){
    //
    //         if(asyncSnapshot.connectionState == ConnectionState.done){
    //
    //           //Hash Error
    //           if(asyncSnapshot.hasError){
    //             return Center(
    //               child: Text("${asyncSnapshot.error}"),
    //             );
    //           }
    //
    //           // No Error
    //           var data = asyncSnapshot.data as int;
    //           print(data);
    //           return Center(
    //             child: Text("$data"),
    //           );
    //         }else{
    //           return Center(
    //             child: CircularProgressIndicator(),
    //           );
    //         }
    //
    //       }),
    // );

    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Demo"),
      ),
      body:  Center(
    child: StreamBuilder<int>(
    stream: _streamController.stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Display a loading spinner
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          return Text(
            'Count: ${snapshot.data}', // Update UI with stream data
            style: TextStyle(fontSize: 24),
          );
        } else {
          return Text('Stream finished');
        }
      },
    ),
    ),
    );
  }
}
