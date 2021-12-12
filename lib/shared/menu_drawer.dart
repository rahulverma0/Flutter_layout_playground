// ignore_for_file: prefer_const_constructors

import 'package:artset/screens/bmi_screen.dart';
import 'package:artset/screens/editor_screen.dart';
import 'package:artset/screens/home_page.dart';
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