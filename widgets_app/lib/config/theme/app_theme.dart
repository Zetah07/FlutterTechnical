import 'package:flutter/material.dart';


const colorList = <Color> [
  Colors.black87,
  Colors.black,
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.yellow,
  Colors.purpleAccent,
  Colors.orange,
  Colors.pink,
  Colors.teal,
  Colors.cyan,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey,
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
    }):assert(selectedColor >= 0, 'Selected color must be greater than 0'),
      assert(selectedColor < colorList.length, 'Selected color must be less than ${colorList.length}');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    )
  );
}