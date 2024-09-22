
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {

  Locale _appLocale = Locale("en");

  Locale get appLocale => _appLocale;

  fetchLocale() async {
    final pref = await SharedPreferences.getInstance();
    if(pref.getString("lang") == null){
      _appLocale = Locale("en");
      return;
    }
    _appLocale = Locale(pref.getString("lang") ?? "en");
    return;
  }

  void changeLocale(Locale locale) async {
    final pref = await SharedPreferences.getInstance();
    if(_appLocale == locale){
      return;
    }
    if(locale.languageCode == "km"){
      _appLocale = Locale("km");
      await pref.setString("lang","km");
    }else{
      _appLocale = Locale("en");
      await pref.setString("lang","en");
    }
    notifyListeners();
  }

}