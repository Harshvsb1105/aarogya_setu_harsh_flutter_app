import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/IntroScreen1.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(EasyLocalization(
      child: MyApp(),
    path: 'assets',
    saveLocale: true,
    supportedLocales: [
      Locale('en','US'),
      Locale('hi','IN')
    ],
  ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen1(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}

