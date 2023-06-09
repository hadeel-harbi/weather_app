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
    return Container(
      width: 380,
      height: 160,
      child: InkWell(
        onTap: () {
          context.pushPage(WeatherDetails(
            currentWeather: currentWeather,
          ));
        },
        child: Stack(
          children: [
            // set background color if day or night
            currentWeather.current!.isDay! == 1
                ? gradientColorsCardLight
                : gradientColorsCardDark,
            Container(
              margin: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Expanded(flex: 1, child: width8),
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentWeather.location!.name!, // <---- name
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "${(currentWeather.current!.tempC)?.toInt()}\u00b0", // <---- degree
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(flex: 1, child: width16)
                  ]),
            ),
            Positioned(
              top: -20,
              right: -13,
              child: SizedBox(
                width: 180,
                height: 180,
                child: getWeatherImage(currentWeather), // <---- image
              ),
            ),
          ],
        ),
      ),
    );
  }
}
