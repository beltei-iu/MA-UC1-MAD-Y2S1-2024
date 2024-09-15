import 'package:flutter/material.dart';
import 'package:mad/routes.dart';
import 'package:mad/services/user_service.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {

  bool _isAlreadyRegister =false;
  bool _isAlreadyLogin =false;


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

    final accountItem = GestureDetector(
      child: Card(
        child: ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("Account"),
          trailing: Icon(Icons.navigate_next),
        ),
      ),
      onTap: (){
        navigationToAccount();
      },
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
          languageItem,
          accountItem
        ],
      ),
    );

    return moreScreen;
  }

  void navigationToAccount() async{

    print("Check Navigate to Account");

    UserService().isAlreadyRegister().then((isAlreadyRegister){
      if(isAlreadyRegister){
        setState(() {
          _isAlreadyRegister = true;
        });
      }else{
        RouteGenerator.key.currentState?.pushNamed(RouteGenerator.registerScreen);
        return;
      }
    }).catchError((error){
      print(error);
      final alertDialog = AlertDialog(
        icon: Icon(Icons.check_circle, color: Colors.red,),
        title: Text("Checked User register failured"),
      );
      showDialog(context: context, builder: (BuildContext context) => alertDialog);
    });

    UserService().isAlreadyLogin().then((isAlreadyLogin){
      if(isAlreadyLogin){
        setState(() {
          _isAlreadyLogin = true;
        });
      }else{
        RouteGenerator.key.currentState?.pushNamed(RouteGenerator.loginScreen);
        return;
      }
    }).catchError((error){
      final alertDialog = AlertDialog(
        icon: Icon(Icons.check_circle, color: Colors.red,),
        title: Text("Checked User login failured"),
      );
      showDialog(context: context, builder: (BuildContext context) => alertDialog);
    });

    if(_isAlreadyRegister && _isAlreadyLogin){
      RouteGenerator.key.currentState?.pushNamed(RouteGenerator.accountScreen);
    }

    if(_isAlreadyRegister && _isAlreadyLogin){
      RouteGenerator.key.currentState?.pushNamed(RouteGenerator.accountScreen);
    }

  }
}
