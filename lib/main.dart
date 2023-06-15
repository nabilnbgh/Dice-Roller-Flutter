import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      title: "Astri App",
      home: Scaffold(
        body: GradientContainer(
          listColor: [
            Color.fromARGB(255, 3, 220, 244),
            Color.fromARGB(255, 142, 231, 241),
          ],
        ),
      ),
    ),
  );
}
