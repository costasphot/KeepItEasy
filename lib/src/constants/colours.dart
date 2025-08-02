// src/constants/colours.dart
// This file includes often-used colour constants.

import "package:flutter/material.dart";

class AppColours {
  // Teal
  static const MaterialColor teal = MaterialColor( // See flutter's 'Color.' file
    _tealPrimaryValue,
    <int, Color>{
      100: Color(_tealPrimaryValue),
      200: Color(0xFF006762),
      300: Color(0xFF004D40),
    },
  );
  static const int _tealPrimaryValue = 0xFF008080;

  // Fire (yellow, orange, red)
  static const MaterialColor fire = MaterialColor(
      _firePrimaryValue,
      <int, Color>{
        100: Color(0xFFFBC02D),
        200: Color(_firePrimaryValue),
        300: Color(0xFFD32F2F),
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
