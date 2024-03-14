import 'dart:convert';
import 'dart:developer';

import 'package:weather/models/weather.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Weather> getWeather(String city) async {
    try {
      final apiUrl =
          'http://api.weatherapi.com/v1/forecast.json?key=d3ae5969d9a6446bbf5141451230706&q=$city&days=1&aqi=no&alerts=no';

      final url = Uri.parse(apiUrl);
      final response = await http.get(url);
      print(response.body);
      final jsonValue = jsonDecode(response.body);
      Weather currentWeather = Weather.fromJson(jsonValue);

      // log('# ${currentWeather.toJson()}');

      return currentWeather;
    } catch (e) {
      print(e);
      throw const FormatException();
    }
  }
}
