import 'package:flutter/material.dart';

Widget myBottomBar(BuildContext context, int currentIndex,
    {required Function() changeIndex}) {
  return Container(
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

          changeIndex.call();
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
  );
}
