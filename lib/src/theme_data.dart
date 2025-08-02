// theme_data.dart
// This file contains the initializations and data for every theme.
// (main.dart) ->

import 'package:flutter/material.dart';
import 'package:keepitez/src/constants/colours.dart';

enum ThemeOption { defaultLight, defaultDark, teal }

final Map<ThemeOption, String> themeOptions = {
  ThemeOption.defaultLight: "Default light",
  ThemeOption.defaultDark: "Default dark",
  ThemeOption.teal: "Teal",
};

class ThemeConfig {
  static final Map<ThemeOption, ThemeData> appThemeData = {
    ThemeOption.defaultLight: ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: Colors.black,
        ),
      ),
    ),

    ThemeOption.defaultDark: ThemeData(
      primarySwatch: Colors.blueGrey,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: Colors.black87,
        ),
      ),
    ),

    ThemeOption.teal: ThemeData(
      primarySwatch: AppColours.teal,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColours.backgroundColour,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColours.primaryColour,
        foregroundColor: AppColours.primaryTextColour,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: AppColours.containerTextColour,
        ),
        bodyMedium: TextStyle(
          color: AppColours.containerTextColour,
        ),
        titleLarge: const TextStyle(
          color: AppColours.primaryTextColour,
          fontWeight: FontWeight.bold,
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColours.buttonColour,
        textTheme: ButtonTextTheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColours.buttonColour,
          foregroundColor: AppColours.buttonTextColour,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColours.accentColour,
        foregroundColor: AppColours.primaryTextColour,
      ),
      iconTheme: const IconThemeData(
        color: AppColours.accentColour,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColours.secondaryColour,
        error: AppColours.errorColour,
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: AppColours.backgroundColour,
        textStyle: TextStyle(
          color: AppColours.containerTextColour,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          side: BorderSide(color: AppColours.borderColour, width: 2.0),
        ),
      ),
    ),
  };
}

class ThemeManager {
  static ThemeOption currentTheme = ThemeOption.teal;

  static ThemeData get currentThemeData => ThemeConfig.appThemeData[currentTheme]!;
  
  static void setTheme(ThemeOption theme) {
    currentTheme = theme;
  }

  // Detects the system theme and sets the initial theme accordingly
  static ThemeOption getSystemTheme() {
    final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    // The property above checks the system's current brightness mode (light or dark).
    return brightness == Brightness.dark ? ThemeOption.defaultDark : ThemeOption.defaultLight;
  }
}
