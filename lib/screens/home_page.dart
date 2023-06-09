import 'package:flutter/material.dart';

import 'package:weather/components/city_weather_card.dart';
import '../components/search_textField.dart';
import '../constants/constants.dart';
import '../data.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          gradientColorsBackgroundLight, // <- background color
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [
                  // ------------- Text
                  const Text(
                    "Weather",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  // ------------- Search TextField
                  const SearchTextField(),

                  // ------------- Cities List View
                  citiesListView(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column citiesListView() {
    return Column(
      children: Data.weatherOfCities
          .map((value) => CityWeatherCard(currentWeather: value))
          .toList(),
    );
  }
}
