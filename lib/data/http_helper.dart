import 'dart:convert';

import 'package:artset/data/weather.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
//http://api.openweathermap.org/data/2.5/weather?q=London&appid=APIKey
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = 'APIKey';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {"q": location, "appId": apiKey};
    Uri uri = Uri.http(authority, path, parameters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);
    return weather;
  }
}
