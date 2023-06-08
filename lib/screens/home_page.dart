import 'dart:convert';

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/components/city_weather_card.dart';
import 'package:weather/extensions/context.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/screens/details_page.dart';
import '../constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Weather currentWeather = Weather();

  List<String> cities = ['Riyadh', ' Jeddah', 'London', 'Seoul', 'Miami'];
  List<Weather> weatherOfCities = [];

  Future getWeather() async {
    for (String city in cities) {
      log(city);
      final baseUrl =
          'http://api.weatherapi.com/v1/current.json?key=d3ae5969d9a6446bbf5141451230706&q=$city';
      final url = Uri.parse(baseUrl);
      final request = await http.get(url);
      final jsonValue = jsonDecode(request.body);
      currentWeather = Weather.fromJson(jsonValue);
      weatherOfCities.add(currentWeather);
      log(currentWeather.toJson().toString());
    }

    setState(() {});
  }

  @override
  void initState() {
    getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 125, 91, 188),
      body: Stack(
        children: [
          gradientColorsBackgroundLight,
          Center(
            child: SafeArea(
                bottom: false,
                child: currentWeather.location == null
                    ? const CircularProgressIndicator()
                    : citiesListView()),
          ),
        ],
      ),
    );
  }

  ListView citiesListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: weatherOfCities.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            onTap: () {
              context.pushPage(DetailsPage(
                currentWeather: weatherOfCities[index],
              ));
            },
            child: CityWeatherCard(
              currentWeather: weatherOfCities[index],
            ));
      },
    );
  }
}
