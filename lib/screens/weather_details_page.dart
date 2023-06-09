import 'package:flutter/material.dart';
import '../components/details_app_bar.dart';
import '../constants/constants.dart';

import '../models/weather.dart';
import '../components/weather_images.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({
    super.key,
    required this.currentWeather,
  });

  final Weather currentWeather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // set background color if day or night
          currentWeather.current?.isDay == null
              ? gradientColorsBackgroundLight
              : currentWeather.current!.isDay! == 1
                  ? gradientColorsBackgroundLight
                  : gradientColorsBackgroundDark,
          SafeArea(
            child: Column(
              children: [
                DetailsAppBar(currentWeather: currentWeather), // <-- AppBar
                height48,
                Text(
                  currentWeather.location!.name!, // <-- city
                  style: const TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                height8,
                Text(
                  currentWeather.location!.localtime!, // <-- date & time
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                height24,
                SizedBox(
                  height: 200,
                  width: 200,
                  child: getWeatherImage(currentWeather), // <-- get image
                ),
                height8,
                Text(
                  '${(currentWeather.current!.tempC)?.toInt()}\u00b0', // <-- weather degree
                  style: const TextStyle(
                      fontSize: 52,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                height8,
                Text(
                  currentWeather.current!.condition!.text!, // <-- weather text
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                height56,
                // --------------- more weather details
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'lib/assets/images/wind_icon.png',
                      height: 50,
                      width: 50,
                    ),
                    Image.asset(
                      'lib/assets/images/humidity_icon.png',
                      height: 50,
                      width: 50,
                    ),
                    Image.asset(
                      'lib/assets/images/precip_icon.png',
                      height: 50,
                      width: 50,
                    ),
                  ],
                ),
                height8,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "${currentWeather.current!.windKph!} Km\\h",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "${currentWeather.current!.humidity!} %",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "${currentWeather.current!.precipIn!} inch",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
