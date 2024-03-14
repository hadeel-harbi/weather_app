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
        Color.fromARGB(255, 125, 91, 188),
        Color.fromARGB(255, 11, 28, 115),
      ],
    ),
  ),
);

final gradientColorsBackground = Container(
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(49, 69, 151, 1),
        Color.fromARGB(255, 33, 37, 78),
      ],
    ),
  ),
);
const gradientColorsCardLight = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color.fromARGB(255, 72, 79, 181),
    Color.fromARGB(255, 78, 140, 227),
  ],
);

const gradientColorsCardDark = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color.fromARGB(255, 97, 83, 166),
    Color.fromARGB(255, 11, 28, 115),
  ],
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
