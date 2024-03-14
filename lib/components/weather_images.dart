import 'package:flutter/material.dart';

import '../models/weather.dart';

Widget getWeatherImage(num code, num isDay) {
  String imageText = "";

  switch (code) {
    case 1000:
      isDay == 1 ? imageText = "sunny" : imageText = "Clear";
      break;
    case 1003:
      isDay == 1
          ? imageText = "Partly_cloudy_day"
          : imageText = "Partly_cloudy_night";
      break;
    case 1006:
    case 1009:
      imageText = "Cloudy";
      break;
    case 1030:
    case 1135:
      imageText = "Wind";
      break;
    case 1063:
    case 1180:
    case 1183:
    case 1186:
    case 1189:
    case 1192:
    case 1195:
    case 1198:
    case 1276:
    case 1273:
      imageText = "Rainy";
    case 1066:
    case 1114:
      imageText = "Snowy";
      break;
    default:
      isDay == 1 ? imageText = "sunny" : imageText = "Clear";
  }

  return Image.asset('lib/assets/images/$imageText.png');
}
