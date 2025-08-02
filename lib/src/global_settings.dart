// global_settings.dart
// This file groups all the global variables needed throughout the entire project.
// . (global file)

import "package:flutter/material.dart";
import "package:flutter/services.dart"; // Handles exiting the app on mobile devices
import "package:flutter/foundation.dart"; // Initializes kDebugMode automatically
import "dart:io"; // Handles exiting the app on desktop platforms and provides info in which the current program is running (Platform)
import "package:keepitez/src/theme_data.dart";

class GlobalSettings with WidgetsBindingObserver {
  static final GlobalSettings instance = GlobalSettings.internal();

  factory GlobalSettings() {
    return instance;
  }

  GlobalSettings.internal();

  // Initialize theme setting
  ThemeOption currentThemeOption = ThemeOption.defaultLight;

  // Provide a getter for the current ThemeData
  ThemeData get themeData => ThemeConfig.appThemeData[currentThemeOption]!;

  // Example of a global MediaQueryData setting (this should be updated in your main widget)
  static MediaQueryData? mediaQueryData;

  // Method to initialize MediaQueryData
  static void initializeMediaQuery(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
  }

  static const bool isDebugMode = kDebugMode; // kDebugMode is initialized in 'flutter/foundation.dart' - is automatically detected

  void initialize() {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      performCleanup();
    }
  }

  void performCleanup() {
    if (kDebugMode) {
      print("DEBUG: Performing cleanup before app termination.");
    }

    // Cleanup code here:
    if (kDebugMode) {
      print("DEBUG: Successfully cleaned up resources.");
    }
  }

  void setTheme(ThemeOption themeOption) {
    currentThemeOption = themeOption;
  }

  static void exitApp() {
    instance.performCleanup();
    if (Platform.isAndroid || Platform.isIOS) {
      SystemNavigator.pop();
    } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      exit(0);
    }
  }
}
