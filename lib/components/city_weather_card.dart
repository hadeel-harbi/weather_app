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
    return InkWell(
      onTap: () {
        context.pushPage(WeatherDetails(
          currentWeather: currentWeather,
        ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            gradient: currentWeather.current!.isDay == 1
                ? gradientColorsCardLight
                : gradientColorsCardDark,
            borderRadius: BorderRadius.circular(16)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          width32,
          Column(
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
              const Text(
                "03:47", // <---- name
                style: TextStyle(
                  color: Color.fromARGB(255, 215, 215, 215),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "${(currentWeather.current!.tempC)?.toInt()}\u00b0", // <---- degree
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: 100,
            height: 100,
            child: getWeatherImage(currentWeather.current!.condition!.code!,
                currentWeather.current!.isDay!),
          ),
          width16,
        ]),
      ),
    );
  }
}
