import 'package:flutter/material.dart';
import 'package:weather/extensions/context.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/screens/get_weather.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
  });

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController textController = TextEditingController();
  Weather currentWeather = Weather();
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        controller: textController,
        decoration: const InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(247, 252, 255, 0.328),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          hintText: 'Enter City ',
          hintStyle: TextStyle(color: Colors.white),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(
              // <-- Search icon
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
        onSubmitted: (text) {
          context.pushPage(
            GetWeatherPage(city: text),
          );
        },
      ),
    );
  }
}
