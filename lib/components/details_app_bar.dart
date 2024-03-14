import 'package:flutter/material.dart';
import 'package:weather/extensions/context.dart';

import '../data.dart';
import '../models/weather.dart';
import '../screens/home_page.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({
    super.key,
    required this.currentWeather,
  });

  final Weather currentWeather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              context.popPage;
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          const Text(
            "Weather",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          InkWell(
            onTap: () {
              if (Data.weatherOfCities.contains(currentWeather)) {
                Data.weatherOfCities.remove(currentWeather);
              } else {
                Data.weatherOfCities.add(currentWeather);
              }
              context
                  .findRootAncestorStateOfType<HomePageState>()
                  // ignore: invalid_use_of_protected_member
                  ?.setState(() {});
              context.pushPage(const HomePage());
            },
            child: Icon(
              Data.weatherOfCities.contains(currentWeather)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
