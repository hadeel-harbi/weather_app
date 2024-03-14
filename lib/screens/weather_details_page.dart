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
                  height: 150,
                  width: 150,
                  child: getWeatherImage(
                      currentWeather.current!.condition!.code!,
                      currentWeather.current!.isDay!), // <-- get image
                ),

                Text(
                  '${(currentWeather.current!.tempC)?.toInt()}\u00b0', // <-- weather degree
                  style: const TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),

                Text(
                  currentWeather.current!.condition!.text!, // <-- weather text
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                height32,
                // --------------- more weather details

                height8,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'lib/assets/images/wind_icon.png',
                          height: 50,
                          width: 50,
                        ),
                        Text(
                          "${currentWeather.current!.windKph!} Km\\h",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'lib/assets/images/humidity_icon.png',
                          height: 50,
                          width: 50,
                        ),
                        Text(
                          "${currentWeather.current!.humidity!} %",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'lib/assets/images/precip_icon.png',
                          height: 50,
                          width: 50,
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
                height56,
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      for (var item in currentWeather.forecast!.forecastday!)
                        for (var weather in item.hour!)
                          if (DateTime.parse(weather.time!).isAfter(
                              DateTime.parse(
                                  currentWeather.location!.localtime!)))
                            Container(
                              margin: const EdgeInsets.only(left: 12),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  // border: Border.all(
                                  //   color: const Color.fromARGB(
                                  //       127, 255, 255, 255),
                                  // ),
                                  gradient: const LinearGradient(colors: [
                                    Color.fromARGB(117, 255, 255, 255),
                                    Color.fromARGB(42, 255, 255, 255)
                                  ], begin: Alignment.topLeft)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(weather.time!.substring(11),
                                      style: const TextStyle(
                                        color: Colors.white,
                                      )),
                                  SizedBox(
                                      width: 50,
                                      child: getWeatherImage(
                                          weather.condition!.code!,
                                          weather.isDay!)),
                                  Text(
                                    weather.tempC.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
