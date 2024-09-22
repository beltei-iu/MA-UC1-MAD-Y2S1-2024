import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mad/localize/app_localize_key.dart';

class AppLocalization {

  final Locale locale;

  AppLocalization(this.locale);

  static AppLocalization? of(BuildContext context){
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  // Option 1
  static Map<String,Map<String,String>> staticData = {
      "en":{
        AppLocalizeKey.getStart.name:"Get Started",
        AppLocalizeKey.home.name:"Home",
        AppLocalizeKey.classroom.name:"Class",
        AppLocalizeKey.more.name:"More"
       },
      "km" : {
        AppLocalizeKey.getStart.name:"ចាប់ផ្តើម",
        AppLocalizeKey.home.name:"ដើម",
        AppLocalizeKey.classroom.name:"ថ្នាក់",
        AppLocalizeKey.more.name:"បន្ថែម"
      }
  };

  Map<String,String>? _localizedStrings;
  // Option 2
  Future<bool> localizedData() async{
     String jsonString = await rootBundle.loadString("assets/langs/${locale.languageCode}.json");
     Map<String,dynamic> jsonMap = json.decode(jsonString);
     _localizedStrings = jsonMap.map((k,v) => MapEntry(k, v.toString()));
     return true;
  }

  String translate(AppLocalizeKey key){
    // Option 1
    // final languageCode = locale.languageCode;
    // return data[languageCode]?[key.name] ?? key.name;

    // Option 2
    return _localizedStrings![key.name] ?? key.name;
  }
}