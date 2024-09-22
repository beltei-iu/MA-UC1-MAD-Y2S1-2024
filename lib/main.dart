import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mad/db/db_helper.dart';
import 'package:mad/localize/app_localization_delegate.dart';
import 'package:mad/provider/language_provider.dart';
import 'package:mad/routes.dart';
import 'package:mad/screens/article_screen.dart';
import 'package:mad/screens/main_screen.dart';
import 'package:mad/screens/product_screen.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.instance.database;
  LanguageProvider languageProvider = LanguageProvider();
  await languageProvider.fetchLocale();
  runApp(App(languageProvider: languageProvider,));
}

class App extends StatelessWidget {

  LanguageProvider languageProvider;

  App({super.key, required this.languageProvider});

  @override
  Widget build(BuildContext context) {

    final provider = ChangeNotifierProvider(

        create: (context) => languageProvider,
        builder: (context, child){
          final provider = Provider.of<LanguageProvider>(context);

          return MaterialApp(
            title: 'AMAD',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF018AAA)),
                useMaterial3: false,
                primaryColor: const Color(0xFF018AAA)
            ),

            // Method 1
            //home: SplashScreen(),

            // Method 2
            initialRoute: RouteGenerator.splashScreen,
            onGenerateRoute: RouteGenerator.onGenerateRoute,
            navigatorKey: RouteGenerator.key,

            // Method 3
            // routes: {
            //   '/': (context) => SplashScreen(),
            //   '/mainScreen' : (context) => MainScreen()
            // },
            debugShowCheckedModeBanner: false,

            //AppLocalization
            locale: provider.appLocale,
            supportedLocales: [
              Locale("en","US"),
              Locale("km","KH")
            ],
            localizationsDelegates: [
              AppLocalizationDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
          );
        },
    );
    return provider;
  }
}