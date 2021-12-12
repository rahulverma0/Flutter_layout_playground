import 'package:http/http.dart' as http;

class HttpHelper {
//http://api.openweathermap.org/data/2.5/weather?q=London&appid=99fb65a51e7d0fc0d214a4da1ecfbd7a
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '99fb65a51e7d0fc0d214a4da1ecfbd7a';

  Future<String> getWeather(String location) async {
    Map<String, dynamic> parameters = {"q": location, "appId": apiKey};
    Uri uri = Uri.http(authority, path, parameters);
    http.Response result = await http.get(uri);
    return result.body;
  }
}
