// ignore_for_file: prefer_const_constructors

import 'package:artset/screens/bmi_screen.dart';
import 'package:artset/screens/editor_screen.dart';
import 'package:artset/screens/home_page.dart';
import 'package:artset/screens/scaffold_example.dart';
import 'package:artset/screens/sessions_screen.dart';
import 'package:artset/screens/weather_screen.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = [
      "Home",
      "Edit",
      "BMI",
      "Weather",
      "Sessions",
      "Scaffold",
      "About",
    ];
    List<Widget> menuItems = [];
    menuItems.add(
      DrawerHeader(
        child: Text(
          "ArtSet",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
        ),
      ),
    );
    menuTitles.forEach((element) {
      Widget screen = Container();
      menuItems.add(
        ListTile(
          title: Text(element,
              style: TextStyle(
                fontSize: 18,
              )),
          onTap: () {
            switch (element) {
              case "Home":
                screen = homePage();
                break;
              case "BMI":
                screen = BmiScreen();
                break;
              case "Weather":
                screen = WeatherScreen();
                break;
              case "Sessions":
                screen = SessionScreen();
                break;
              case "Scaffold":
                screen = ScaffoldExample();
                break;
            }
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => screen),
            );
          },
        ),
      );
    });
    return menuItems;
  }
}
