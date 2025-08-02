// src/app.dart
// This file

import "package:flutter/material.dart";
import "package:keepitez/src/views/home_view.dart";
import "package:keepitez/src/theme_data.dart";

class KeepItEz extends StatelessWidget {
  const KeepItEz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeView(),
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.currentThemeData,
    );
  }
}
