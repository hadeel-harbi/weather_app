import 'package:flutter/material.dart';

import 'screens/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Encode Sans"),
      home: const Scaffold(
        body: HomePage(),
      ),
    );
  }
}
