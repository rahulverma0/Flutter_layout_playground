// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:artset/shared/menu_bottom.dart';
import 'package:artset/shared/menu_drawer.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();
  String result = "";
  bool isMetric = true;
  bool isImperial = false;
  double? height;
  double? weight;
  final double fontsize = 18;
  late List<bool> isSelected;
  String heightMessage = '';
  String weightMessage = '';
  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMessage =
        "Please enter your height in " + (isMetric ? "meters" : "inches");
    weightMessage =
        "Please enter your weight in " + (isMetric ? "Kgs" : "pounds");
    return Scaffold(
        drawer: MenuDrawer(),
        bottomNavigationBar: menu_bottom(),
        appBar: AppBar(
          title: Text("BMI"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ToggleButtons(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Text(
                      "metric",
                      style: TextStyle(fontSize: fontsize),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Text(
                      "Imperial",
                      style: TextStyle(fontSize: fontsize),
                    ),
                  ),
                ],
                isSelected: isSelected,
                onPressed: toggleMeasure,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextField(
                  controller: txtHeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: heightMessage,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: TextField(
                  controller: txtWeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: weightMessage,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: findBmi,
                child: Text(
                  "Calculate",
                  style: TextStyle(fontSize: fontsize),
                ),
              ),
              Text(
                result,
                style: TextStyle(fontSize: fontsize),
              )
            ],
          ),
        ));
  }

  void toggleMeasure(value) {
    if (value == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }

  void findBmi() {
    double bmi = 0;
    double height = double.tryParse(txtHeight.text) ?? 0;
    double weight = double.tryParse(txtWeight.text) ?? 0;
    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = (weight * 703) / (height * height);
    }
    setState(() {
      result = "Your BMI is " + bmi.toStringAsFixed(2);
    });
  }
}
