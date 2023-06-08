import 'package:flutter/material.dart';
import 'package:weather/extensions/context.dart';
import 'package:weather/screens/result_page.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.textController,
  });

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        controller: textController,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromRGBO(247, 252, 255, 0.328),
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          hintText: 'Enter City ',
          hintStyle: const TextStyle(color: Colors.white),
          prefix: const Icon(
            // <-- Search icon
            Icons.search,
            color: Colors.white,
          ),
          suffix: InkWell(
            onTap: () {
              context.pushPage(ResultPage(
                city: textController.text,
              ));
            },
            child: const Text(
              "Search",
              style: TextStyle(color: Color.fromARGB(255, 97, 75, 157)),
            ),
          ),
        ),
      ),
    );
  }
}
