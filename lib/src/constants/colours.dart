// src/constants/colours.dart
// This file includes often-used colour constants.

import "package:flutter/material.dart";

class AppColours {
  // Teal
  static const MaterialColor teal = MaterialColor(
    _tealPrimaryValue,
    <int, Color>{
      50:  Color(0xFFE0F2F1),
      100: Color(0xFFB2DFDB),
      200: Color(0xFF80CBC4),
      300: Color(0xFF4DB6AC),
      400: Color(0xFF26A69A),
      500: Color(_tealPrimaryValue),
      600: Color(0xFF00897B),
      700: Color(0xFF00796B),
      800: Color(0xFF00695C),
      900: Color(0xFF004D40),
    },
  );
  static const int _tealPrimaryValue = 0xFF008080;

  // Fire (yellow, orange, red)
  static const MaterialColor fire = MaterialColor(
    _firePrimaryValue,
    <int, Color>{
      50:  Color(0xFFFFF3E0),
      100: Color(0xFFFFE0B2),
      200: Color(0xFFFFCC80),
      300: Color(0xFFFFB74D),
      400: Color(0xFFFFA726),
      500: Color(_firePrimaryValue),
      600: Color(0xFFFB8C00),
      700: Color(0xFFF57C00),
      800: Color(0xFFEF6C00),
      900: Color(0xFFE65100),
    },
  );
  static const int _firePrimaryValue = 0xFFFFA726;

  static const Color softCream = Color(0xFFF9F9E0);

  // Primary colours
  static const Color primaryColour = Color(_tealPrimaryValue);
  static const Color primaryTextColour = Colors.white;
  
  // Background colours
  static const Color backgroundColour = softCream;
  static final Color containerTextColour = teal[300]!;

  // Accent colours
  static const Color accentColour = Color(_firePrimaryValue);
  static const Color secondaryColour = Colors.green;

  // Button colours
  static final Color buttonColour = teal[200]!;
  static const Color buttonTextColour = Colors.white;

  // Border colours
  static final Color borderColour = teal[200]!;

  // Additional colours
  static final Color errorColour = fire[300]!;
  static final Color warningColour = fire[100]!;
}
