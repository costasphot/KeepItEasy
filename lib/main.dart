// main.dart
// This file contains the initialization and starting point of the application.

import "package:flutter/material.dart";
import "package:keepitez/src/global_settings.dart";
import "package:keepitez/src/app.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GlobalSettings().initialize();
  runApp(const KeepItEz());
}
