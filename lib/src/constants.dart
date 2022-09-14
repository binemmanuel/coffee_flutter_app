import 'package:flutter/material.dart';

abstract class Constants {
  static const Color mainAppColor = Color.fromARGB(255, 210, 126, 0);
  static const Color backgroundColor = Color.fromARGB(255, 17, 51, 79);
  static const Color backgroundDarkColor = Color.fromARGB(255, 5, 16, 25);
  static const Color iconColor = Color.fromARGB(255, 132, 132, 132);

  static const List<Color> darkGradient = [
    Color.fromARGB(95, 17, 51, 79),
    Color.fromARGB(160, 31, 31, 31),
    Color.fromARGB(142, 21, 21, 21),
  ];

  static const List<Color> lightGradient = [
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  static const List<BoxShadow> darkBoxShadow = [
    BoxShadow(
      color: Color.fromARGB(40, 17, 51, 79),
      blurRadius: 5,
      offset: Offset(1, 1),
    ),
  ];
}
