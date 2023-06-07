import 'package:flutter/material.dart';

import 'home_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 65, 56, 123),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          "Search City",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: textController,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(79, 158, 158, 158),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              hintText: 'Enter City ',
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(city: textController.text)),
            );
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Color.fromARGB(255, 93, 182, 226),
            elevation: 0,
            minimumSize: const Size(340, 40),
          ),
          child: const Text(
            "Seaarch",
            style: TextStyle(fontSize: 20),
          ),
        )
      ]),
    );
  }
}
