// settings_functionality.dart
// The file implements the functionalities of the 'Settings' button.

// ignore_for_file: invalid_use_of_protected_member
// TODO: maybe fix the above

import 'package:flutter/material.dart';

// Define the enum for settings options
enum SettingOption { option1, option2, option3 }

const int settingsButtonDelayMilliseconds = 220;

// Define the options for the popup menu
final Map<SettingOption, String> settingOptions = {
  SettingOption.option1: "Setting 1",
  SettingOption.option2: "Setting 2",
  SettingOption.option3: "Exit",
};

class SettingsFunctionality {
  bool showTooltip = false;
  SettingOption? selectedOption;

  void handleSettingOptionChange(State state, SettingOption? value) {
    state.setState(() {
      selectedOption = value;
      showTooltip = true;
    });

    if (value != null) {
      switch (value) {
        case SettingOption.option1:
          // Add functionality for Setting 1
          break;
        case SettingOption.option2:
          // Add functionality for Setting 2
          break;
        case SettingOption.option3:
          // Add functionality for Setting 3
          break;
      }
    }

    Future.delayed(const Duration(milliseconds: settingsButtonDelayMilliseconds), () {
      state.setState(() {
        showTooltip = false;
      });
    });
  }

  void handlePopupMenuCanceled(State state) {
    state.setState(() {
      showTooltip = true;
    });

    Future.delayed(const Duration(milliseconds: settingsButtonDelayMilliseconds), () {
      state.setState(() {
        showTooltip = false;
      });
    });
  }
}
