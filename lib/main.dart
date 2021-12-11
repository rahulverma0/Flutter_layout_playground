// ignore_for_file: prefer_const_constructors

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: homePage(),
    );
  }
}
