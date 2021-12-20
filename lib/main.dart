// ignore_for_file: prefer_const_constructors

import 'package:artset/screens/bmi_screen.dart';
import 'package:artset/screens/editor_screen.dart';
import 'package:artset/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ArtSet());
}

class ArtSet extends StatelessWidget {
  const ArtSet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 24),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => homePage(),
        "/edit": (context) => Editor(),
        "/bmi": (context) => BmiScreen(),
      },
      initialRoute: "/",

      //home: homePage(),
    );
  }
}
