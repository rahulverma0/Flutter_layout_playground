// ignore_for_file: prefer_const_constructors

import 'package:artset/data/http_helper.dart';
import 'package:artset/data/weather.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather result = Weather('', '', 0, 0, 0, 0);
  final TextEditingController txtPlace = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Weather"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: txtPlace,
                  decoration: InputDecoration(
                      hintText: 'Enter a city',
                      suffixIcon: IconButton(
                        onPressed: getData,
                        icon: Icon(Icons.search),
                      )),
                ),
              ),
              weatherRow('Place', result.name),
              weatherRow('Descript', result.description),
              weatherRow('Temp ', result.temperature.toStringAsFixed(2)),
              weatherRow('Feels like ', result.perceived.toStringAsFixed(2)),
              weatherRow('Pressue ', result.pressure.toString()),
              weatherRow('Humidity ', result.humidity.toString()),
            ],
          ),
        ));
  }

  Future getData() async {
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather(txtPlace.text);
    setState(() {
      result = result;
    });
  }

  Widget weatherRow(String label, String value) {
    Widget row = Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style:
                  TextStyle(fontSize: 20, color: Theme.of(context).hintColor),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              value,
              style: TextStyle(
                  fontSize: 20, color: Theme.of(context).primaryColor),
            ),
          )
        ],
      ),
    );
    return row;
  }
}
