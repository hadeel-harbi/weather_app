import 'package:flutter/material.dart';
import 'package:weather/components/weather_details.dart';
import 'package:weather/models/weather.dart';

import '../constants/constants.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.currentWeather});

  final Weather currentWeather;

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
          SafeArea(
            child: Center(
              child: WeatherDetails(currentWeather: currentWeather),
            ),
          ),
        ],
      ),
    );
  }
}
