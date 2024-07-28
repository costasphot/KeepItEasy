// global_settings.dart
// This file groups all the global variables needed throughout the entire project.
// . (global file)

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter/foundation.dart";

void exitApp() {
  SystemNavigator.pop();
}

class GlobalSettings {
  // Example of a global theme setting
  static ThemeData themeData = ThemeData.light();

  // Example of a global MediaQueryData setting (this should be updated in your main widget)
  static MediaQueryData? mediaQueryData;

  // Method to initialize MediaQueryData
  static void initializeMediaQuery(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
  }

  static const bool isDebugMode = kDebugMode; // kDebugMode is initialized in 'flutter/foundation.dart' - is automatically detected
}
