import 'package:flutter/material.dart';
import 'package:mad/routes.dart';
import 'package:mad/services/user_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  TextEditingController _fullName = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        elevation: 5,
      ),
      body: Column(
        children: [
          _logo,
          _fullNameTextField,
          _usernameTextField,
          _passwordTextField,
          _registerButton,
          SizedBox(height: 80,)
        ],
      ),
    );
  }

  Widget get _logo {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Center(child: Image.asset("assets/images/beltei_iu_logo.png", width: 100,)),
    );
  }

  Widget get _fullNameTextField {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _fullName,
        decoration: InputDecoration(
            hintText: "Full Name",
            prefixIcon: Icon(Icons.account_circle)
        ),
      ),
    );
  }

  Widget get _usernameTextField {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _username,
        decoration: InputDecoration(
            hintText: "Username",
            prefixIcon: Icon(Icons.account_circle)
        ),
      ),
    );
  }

  Widget get _passwordTextField {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _password,
        decoration: InputDecoration(
            hintText: "Password",
            prefixIcon: Icon(Icons.password)
        ),
      ),
    );
  }

  Widget get _registerButton {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: ElevatedButton(
          onPressed: (){
            _handleLoginClick();
          },
          child: Text("Register"),
        ),
      ),
    );
  }

  void _handleLoginClick(){
    String fullName = _fullName.text;
    String username = _username.text;
    String password = _password.text;
    print("fullName $fullName");
    print("username $username");
    print("password $password");

    if(fullName.isEmpty){
      final alertDialog = AlertDialog(
        icon: Icon(Icons.cancel, color: Colors.red,size: 80,),
        title: Text("Full Name"),
        content: Text("Please input full name"),
        actions: [
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Ok"))
        ],
      );
      showDialog(context: context, builder: (BuildContext context) => alertDialog);
    }else if(username.isEmpty){
      final alertDialog = AlertDialog(
        icon: Icon(Icons.cancel, color: Colors.red,size: 80,),
        title: Text("Username"),
        content: Text("Please input username"),
        actions: [
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Ok"))
        ],
      );
      showDialog(context: context, builder: (BuildContext context) => alertDialog);
    }else if(password.isEmpty){
      final alertDialog = AlertDialog(
        icon: Icon(Icons.cancel, color: Colors.red,size: 80,),
        title: Text("Password"),
        content: Text("Please input password"),
        actions: [
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Ok"))
        ],
      );
      showDialog(context: context, builder: (BuildContext context) => alertDialog);
    }else{
      UserService().register(fullName, username, password).then((isRegister){
        final alertDialog = AlertDialog(
          icon: Icon(Icons.check_circle, color: Colors.greenAccent,),
          title: Text("Registered"),
          content: Text("Registered was successfully"),
        );
        showDialog(context: context, builder: (BuildContext context) => alertDialog);
        Future.delayed(Duration(seconds: 5));
        RouteGenerator.key.currentState?.pushReplacementNamed(RouteGenerator.loginScreen);
      }).catchError((error){
        final alertDialog = AlertDialog(
          icon: Icon(Icons.cancel, color: Colors.red,),
          title: Text("Registered"),
          content: Text("Registered was failured"),
        );
        showDialog(context: context, builder: (BuildContext context) => alertDialog);
      });
    }
  }
}
