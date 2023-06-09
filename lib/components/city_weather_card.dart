import 'package:flutter/material.dart';
import 'package:weather/extensions/context.dart';
import 'package:weather/models/weather.dart';

import '../constants/constants.dart';
import '../screens/weather_details_page.dart';
import 'weather_images.dart';

class CityWeatherCard extends StatelessWidget {
  const CityWeatherCard({super.key, required this.currentWeather});
  final Weather currentWeather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Card(
        color: const Color.fromRGBO(247, 252, 255, 0.328),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: InkWell(
          onTap: () {
            context.pushPage(WeatherDetails(currentWeather: currentWeather));
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 0, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentWeather.location!.name!, // <-------- name
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      height8,
                      Text(
                        "${(currentWeather.current!.tempC)?.toInt()}\u00b0", // <-------- degree
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                width32,
                Expanded(
                  flex: 1,

                  child: getWeatherImage(currentWeather), // <-------- image
                ),
                width16
              ],
            ),
          ),
        ),
      ),
    );
  }
}
