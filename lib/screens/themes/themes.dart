import 'package:flutter/material.dart';

enum AppTheme {
  White, Dark, LightBlue, DarkBlue
}

/// Returns enum value name without enum class name.
String enumName(AppTheme anyEnum) {
  return anyEnum.toString().split('.')[1];
}

final appThemeData = {
  AppTheme.White : ThemeData(
    brightness: Brightness.light,
    accentColor: Colors.red,
    primaryColor: Colors.white,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.grey,
    )
  ),
  AppTheme.Dark : ThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.red,
    primaryColor: Colors.black,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.red,
    )
  ),
  AppTheme.LightBlue : ThemeData(
    brightness: Brightness.light,
    accentColor: Colors.lightBlue,
    primaryColor: Colors.lightBlue,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.lightBlue,
    )
  ),
  AppTheme.DarkBlue : ThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.blue,
    primaryColor: Colors.blue,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
    )
  )
};