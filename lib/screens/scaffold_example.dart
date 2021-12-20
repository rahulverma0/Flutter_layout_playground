import 'package:flutter/material.dart';

class ScaffoldExample extends StatelessWidget {
  const ScaffoldExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Bar demo"),
      ),
      body: Center(
        child: Text("Hello from the body"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.light_outlined),
        onPressed: () {},
      ),
      persistentFooterButtons: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.add),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.add_alarm),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.add_location),
        ),
      ],
    );
  }
}
