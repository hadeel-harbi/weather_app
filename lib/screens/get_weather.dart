import 'package:flutter/material.dart';
import 'package:weather/screens/weather_details_page.dart';
import 'package:weather/models/weather.dart';

import '../services/api.dart';

class GetWeatherPage extends StatelessWidget {
  const GetWeatherPage({super.key, required this.city});

  final String city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 125, 91, 188),
      body: body(),
    );
  }

  body() {
    return FutureBuilder(
        future: ApiService().getWeather(city),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            Weather currentWeather = snapshot.data!;
            return currentWeather.location == null
                ? const Center(child: CircularProgressIndicator())
                : WeatherDetails(currentWeather: snapshot.data!);
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
