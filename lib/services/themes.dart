import 'package:flutter/material.dart';

Color accentColor = Color(0xFFF67400);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  primaryColorLight: Colors.white,
  primaryColorDark: Color(0xffe3e3e3),
  toggleableActiveColor: accentColor,
  accentColor: accentColor,
  splashColor: accentColor,
  buttonTheme: buttonThemeData,
  cardTheme: cardTheme,
  dialogTheme: dialogTheme,
  sliderTheme: sliderThemeData,
  toggleButtonsTheme: toggleButtonsTheme,
);
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  primaryColorLight: Color(0xFF171717),
  primaryColorDark: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  toggleableActiveColor: accentColor,
  accentColor: accentColor,
  splashColor: accentColor,
  buttonTheme: buttonThemeData,
  cardTheme: cardTheme.copyWith(color: Color(0xFF0f0f0f)),
  dialogTheme: dialogTheme.copyWith(backgroundColor: Color(0xFF0f0f0f)),
  sliderTheme: sliderThemeData,
  toggleButtonsTheme: toggleButtonsTheme,
);

SliderThemeData sliderThemeData =
    SliderThemeData(thumbColor: accentColor, activeTrackColor: accentColor);

ButtonThemeData buttonThemeData = ButtonThemeData(
  splashColor: accentColor,
  highlightColor: accentColor,
  shape: RoundedRectangleBorder(
    side: BorderSide(
      style: BorderStyle.solid,
      color: accentColor,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
);

CardTheme cardTheme = CardTheme(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)));

DialogTheme dialogTheme = DialogTheme(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(style: BorderStyle.solid, color: accentColor)));

ToggleButtonsThemeData toggleButtonsTheme = ToggleButtonsThemeData(
    color: accentColor, splashColor: accentColor, selectedColor: accentColor);
