import 'package:flutter/material.dart';
import 'package:mad/routes.dart';
import 'package:mad/services/user_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        elevation: 5,
      ),
      body: Column(
        children: [
          _logo,
          _usernameTextField,
          _passwordTextField,
          _loginButton,
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

  Widget get _loginButton {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: ElevatedButton(
            onPressed: (){
              _handleLoginClick();
            },
            child: Text("Login"),
        ),
      ),
    );
  }

  void _handleLoginClick(){
    String username = _username.text;
    String password = _password.text;
    print("username $username");
    print("password $password");

    if(username.isEmpty){
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
      UserService().login(username, password).then((isLoginSuccess){
        if(isLoginSuccess){
          RouteGenerator.key.currentState?.pushNamed(RouteGenerator.accountScreen);
        }else{
          final alertDialog = AlertDialog(
            icon: Icon(Icons.check_circle, color: Colors.greenAccent,),
            title: Text("Login"),
            content: Text("Login was failure"),
            actions: [
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Ok"))
            ],
          );
          showDialog(context: context, builder: (BuildContext context) => alertDialog);
          Future.delayed(Duration(seconds: 5));
        }
      }).catchError((error){
        final alertDialog = AlertDialog(
          icon: Icon(Icons.cancel, color: Colors.red,size: 80,),
          title: Text("Login"),
          content: Text("Login was failured"),
          actions: [
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Ok"))
          ],
        );
        showDialog(context: context, builder: (BuildContext context) => alertDialog);
      });
    }
  }
}
