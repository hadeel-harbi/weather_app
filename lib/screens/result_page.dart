import 'dart:convert';

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/extensions/context.dart';
import 'package:weather/models/weather.dart';
import '../components/weather_details.dart';
import '../constants/constants.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({
    super.key,
    required this.city,
  });
  final String? city;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Weather currentWeather = Weather();
  bool weatherIsNull = false;

  Future getWeather(String city) async {
    final baseUrl =
        'http://api.weatherapi.com/v1/current.json?key=d3ae5969d9a6446bbf5141451230706&q=$city';
    final url = Uri.parse(baseUrl);
    final request = await http.get(url);
    final Map<String, dynamic> jsonValue = jsonDecode(request.body);
    currentWeather = Weather.fromJson(jsonValue);
    log(currentWeather.toJson().toString());

    // if city not found
    if (currentWeather.current == null) {
      if (jsonValue['error']['code'] == 1006) {
        weatherIsNull = true;
        setState(() {});
      }
    }

    setState(() {});
  }

  @override
  void initState() {
    String city = widget.city ?? '';
    getWeather(city);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 125, 91, 188),
      body: Stack(
        children: [
          currentWeather.current?.isDay == null
              ? gradientColorsBackgroundLight
              : currentWeather.current!.isDay! == 1
                  ? gradientColorsBackgroundLight
                  : gradientColorsBackgroundDark,
          Center(
            child: SafeArea(
              bottom: false,
              child: weatherIsNull == true
                  ? notFound()
                  : currentWeather.location == null
                      ? const CircularProgressIndicator()
                      : WeatherDetails(currentWeather: currentWeather),
            ),
          ),
        ],
      ),
    );
  }

  Widget notFound() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Sorry Not Found",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          height8,
          ElevatedButton(
              onPressed: () {
                context.popPage;
              },
              child: const Text("Go Back"))
        ],
      ),
    );
  }
}
