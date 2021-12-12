import 'package:flutter/material.dart';

class menu_bottom extends StatelessWidget {
  const menu_bottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, "/");
            break;
          case 1:
            Navigator.pushNamed(context, "/edit");
            break;
          case 2:
            Navigator.pushNamed(context, "/bmi");
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.edit,
          ),
          label: "Edit",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.health_and_safety,
          ),
          label: "BMI",
        )
      ],
    );
  }
}
