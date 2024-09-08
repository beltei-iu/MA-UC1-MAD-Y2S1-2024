import 'package:flutter/material.dart';
import 'package:mad/screens/main_screen.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: _logoWidget),
          _getStartWidget
        ],
      ),
    );
  }

  Widget get _logoWidget{
    return Center(
      child: Image.asset("assets/images/beltei_iu_logo.png",
        height: 150,),
    );
  }

  Widget get _getStartWidget {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: MediaQuery.of(context).size.width,
          height: 40,
          child: ElevatedButton(onPressed: (){
            final route = MaterialPageRoute(builder: (BuildContext context) => MainScreen());
            Navigator.pushReplacement(context, route);
          }, child: Text("Get Start"))
      ),
    );
  }
}
