import 'package:flutter/material.dart';
import 'package:mad/main.dart';
import 'package:mad/routes.dart';
import 'package:mad/services/user_service.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  String fullName = "";

  @override
  void initState() {
    super.initState();
    //loadUser();
  }

  void loadUser() async {
      UserService().getFullName().then((fullname){

        print(fullname);

        setState(() {
          fullName = fullname;
        });
      }).catchError((onError){
        print("Error $onError");
      });
  }


  @override
  Widget build(BuildContext context) {

    UserService().getFullName().then((fullname){

      print(fullname);

      setState(() {
        fullName = fullname;
      });
    }).catchError((onError){
      print("Error $onError");
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
        elevation: 5,
      ),
      body: Center(
        child: Column(
          children: [
            Text("Full Name : $fullName"),
            ElevatedButton(
                onPressed: (){
                  handleLogout();
                }, child: Text("Logout")
            ),
          ],
        )
      ),
    );
  }

  void handleLogout() async {
    await UserService().logout();
    RouteGenerator.key.currentState?.pushReplacementNamed(RouteGenerator.mainScreen);
  }
}
