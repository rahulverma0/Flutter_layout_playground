import 'package:artset/shared/menu_bottom.dart';
import 'package:artset/shared/menu_drawer.dart';
import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  const Editor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      bottomNavigationBar: menu_bottom(),
      appBar: AppBar(
        title: Text("Editor"),
      ),
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}
