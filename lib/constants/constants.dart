import 'package:flutter/material.dart';

final gradientColorsBackgroundLight = Container(
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(118, 209, 255, 1),
        Color.fromARGB(255, 80, 93, 214),
      ],
    ),
  ),
);

final gradientColorsBackgroundDark = Container(
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromARGB(255, 11, 28, 115),
        Color.fromARGB(255, 125, 91, 188),
      ],
    ),
  ),
);

final gradientColorsCardLight = Container(
  margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
  decoration: BoxDecoration(
    boxShadow: const [
      BoxShadow(
        color: Color.fromARGB(107, 54, 82, 116),
        spreadRadius: 0,
        blurRadius: 11,
        offset: Offset(6, 6),
      ),
    ],
    borderRadius: BorderRadius.circular(30),
    gradient: const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(174, 239, 255, 1),
        Color.fromARGB(255, 26, 146, 237),
      ],
    ),
  ),
);

final gradientColorsCardDark = Container(
  margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
  decoration: BoxDecoration(
    boxShadow: const [
      BoxShadow(
        color: Color.fromARGB(107, 54, 82, 116),
        spreadRadius: 0,
        blurRadius: 11,
        offset: Offset(6, 6),
      ),
    ],
    borderRadius: BorderRadius.circular(30),
    gradient: const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(143, 199, 255, 1),
        Color.fromARGB(255, 35, 42, 175),
      ],
    ),
  ),
);

const height8 = SizedBox(height: 8);
const height16 = SizedBox(height: 16);
const height24 = SizedBox(height: 24);
const height32 = SizedBox(height: 32);
const height48 = SizedBox(height: 48);
const height56 = SizedBox(height: 56);
const height96 = SizedBox(height: 96);

const width8 = SizedBox(width: 8);
const width16 = SizedBox(width: 16);
const width24 = SizedBox(width: 24);
const width32 = SizedBox(width: 32);
