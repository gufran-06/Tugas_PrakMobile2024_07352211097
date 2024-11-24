import 'package:flutter/material.dart';
// import 'package:flutter_application_1/splashscreen.dart';
import 'package:flutter_application_1/splash.dart';
import 'package:flutter_application_1/splashscreen.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Gufran E-Commerce",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {'/': (context) => SplashScreen(), '/home': (context) => Home()});
  }
}
