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
      backgroundColor: const Color.fromARGB(255, 125, 91, 188),
      body: Stack(
        children: [
          gradientColorsBackgroundLight, // <- background color
          SafeArea(
            bottom: false,
            child: ListView(
              children: [
                // ------------- Search TextField
                const SearchTextField(),

                // ------------- Cities List View

                citiesListView(),
              ],
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
