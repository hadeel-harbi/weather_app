import 'package:flutter/material.dart';
import 'package:weather/constants/constants.dart';
import 'package:weather/screens/weather_details_page.dart';
import 'package:weather/models/weather.dart';

import '../services/api.dart';

class GetWeatherPage extends StatelessWidget {
  const GetWeatherPage({super.key, required this.city});

  final String city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [gradientColorsBackgroundLight, body()],
      ),
    );
  }

  body() {
    return FutureBuilder(
        future: ApiService().getWeather(city),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            Weather currentWeather = snapshot.data!;
            return currentWeather.error?.code == 1006 // if city not found
                ? notFound(context)
                : currentWeather.location == null
                    ? const Center(child: CircularProgressIndicator())
                    : WeatherDetails(currentWeather: snapshot.data!);
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  Widget notFound(BuildContext context) {
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
                Navigator.pop(context);
              },
              child: const Text("Go Back"))
        ],
      ),
    );
  }
}
