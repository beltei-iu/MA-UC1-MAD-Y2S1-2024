
import 'package:shared_preferences/shared_preferences.dart';

class UserService {

  Future<String> getFullName() async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString("fullName") ?? "Unknown";
  }
  Future<bool> register(String fullName, String username, String password) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("fullName", fullName);
    sharedPref.setString("username", username);
    sharedPref.setString("password", password);
    sharedPref.setBool("isRegistered", true);
    return true;
  }

  Future<bool> login(String usernameInput, String passwordInput) async{
    final sharedPref = await SharedPreferences.getInstance();
    String username = sharedPref.getString("username") ?? "";
    String password = sharedPref.getString("password") ?? "";
    if(usernameInput == username && passwordInput == password){
      sharedPref.setBool("isLogin", true);
      return true;
    }
    return false;
  }

  Future<bool> isAlreadyRegister() async {
    final sharedPref = await SharedPreferences.getInstance();
    bool isAlreadyRegister = sharedPref.getBool("isRegistered") ?? false;
    print("isAlreadyRegister $isAlreadyRegister");
    return isAlreadyRegister;
  }

  Future<bool> isAlreadyLogin() async{
    final sharedPref = await SharedPreferences.getInstance();
    bool isAlreadyLogin = sharedPref.getBool("isLogin") ?? false;
    return isAlreadyLogin;
  }

  Future<void> logout() async{
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.remove("fullName");
    sharedPref.remove("username");
    sharedPref.remove("password");
    sharedPref.remove("isRegistered");
    sharedPref.remove("isLogin");
  }


}