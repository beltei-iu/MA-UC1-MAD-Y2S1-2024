
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mad/localize/app_localization.dart';

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization>{

  @override
  bool isSupported(Locale locale) {
    return ["en","km"].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    // Option 1
    // return SynchronousFuture<AppLocalization>(
    //   AppLocalization(locale)
    // );

    // Option 2
    AppLocalization appLocalization = AppLocalization(locale);
    await appLocalization.localizedData();
    return appLocalization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate old) {
    return false;
  }
}