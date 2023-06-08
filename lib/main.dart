import 'package:flutter/material.dart';

import 'screens/home_page.dart';
import 'screens/search_page.dart';

void main() {
  runApp(const MainApp());
}

// ignore: must_be_immutable
class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int currentIndex = 0;

  List myScreenList = [const HomePage(), const SearchPage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBody: true,
        // -------------- Bottom Navigation Bar ----------
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 1, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              onTap: (value) {
                currentIndex = value;
                setState(() {});
              },
              currentIndex: currentIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: const Color.fromARGB(255, 125, 91, 188),
              unselectedItemColor: Colors.grey,
              iconSize: 28,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  label: '',
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: '',
                  icon: Icon(Icons.search),
                ),
              ],
            ),
          ),
        ),
        // --------- body -------------
        body: myScreenList[currentIndex],
      ),
    );
  }
}
