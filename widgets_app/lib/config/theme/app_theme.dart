import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class AppTheme {
  final int selectColor;
  final bool isDarkMode;

  AppTheme({this.selectColor = 0, this.isDarkMode = true})
      : assert(selectColor >= 0, ' El color no puede ser menor a 0'),
        assert(selectColor < colorList.length,
            ' El color no puede ser mayor a ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
      colorSchemeSeed: colorList[selectColor],
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      useMaterial3: true,
      appBarTheme: AppBarTheme(centerTitle: false));

  AppTheme copyWith({int? selectColor, bool? isDarkMode}) => AppTheme(
        selectColor: selectColor ?? this.selectColor,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );
}
