import 'package:flutter/material.dart';

const List<Color> listColor = [
  Color(0xFF6C63FF), // Morado elegante
  Color(0xFF4FC3F7), // Azul suave
  Color(0xFF26A69A), // Verde aqua
  Color(0xFFFF7043), // Naranja coral moderno
  Color(0xFFEC407A), // Rosa fuerte y vibrante
  Color(0xFF29B6F6), // Celeste brillante
];

class AppTheme {
  final bool isDarkMode;
  final int seletedColor;

  AppTheme(
    {
      this.isDarkMode = false,
      this.seletedColor = 0
    }
  ): assert(seletedColor >=0 && seletedColor < listColor.length,
  "selectedColor must be between 0 and ${listColor.length - 1}");

  ThemeData getTheme() => ThemeData(
    colorSchemeSeed: listColor[seletedColor],
    brightness: isDarkMode ? Brightness.dark : Brightness.light
  );
}
