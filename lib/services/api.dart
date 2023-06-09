import 'dart:convert';
import 'dart:developer';

import 'package:weather/models/weather.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final apiBaseUrl =
      'http://api.weatherapi.com/v1/current.json?key=d3ae5969d9a6446bbf5141451230706&q=';

  Future<Weather> getWeather(String city) async {
    final url = Uri.parse(apiBaseUrl + city);
    final request = await http.get(url);
    final jsonValue = jsonDecode(request.body);
    Weather currentWeather = Weather.fromJson(jsonValue);

    log('# ${currentWeather.toJson()}');

    return currentWeather;
  }
}
