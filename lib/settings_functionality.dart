// settings_functionality.dart
// This file implements the functionalities of the 'Settings' button.
// (main.dart) -> .

import "package:flutter/material.dart";

import "./languages_implementation.dart";
import "./language_data.dart";
import "./global_settings.dart";

// Define the enum for settings options
enum SettingOption { option1, option2, option3 }

const int settingsButtonDelayMilliseconds = 220;

// Define the options for the popup menu
final Map<SettingOption, String> settingOptions = {
  SettingOption.option1: LanguageData.getText("setting1"), // Themes
  SettingOption.option2: LanguageData.getText("setting2"), // Languages
  SettingOption.option3: LanguageData.getText("setting3"), // Exit
};

class SettingsFunctionality {
  bool showTooltip = false;
  SettingOption? selectedOption;
  LanguageOption? selectedLanguage = LanguageOption.english; // Default language

  void handleSettingOptionChange(BuildContext context, VoidCallback setStateCallback, SettingOption? value) {
    setStateCallback();

    showTooltip = true;
    selectedOption = value;

    if (value != null) {
      switch (value) {
        case SettingOption.option1:
          // Add functionality for Themes
          break;
        case SettingOption.option2:
          showLanguagesPopup(context, selectedLanguage, (LanguageOption newLanguage) {
            selectedLanguage = newLanguage;
            LanguageData.setLanguage(LanguageData.getLanguageCode(newLanguage));
            setStateCallback();
          });
          break;
        case SettingOption.option3:
          Navigator.of(context).pop(); // Exit the current pop-up menu first
          exitApp();
          break;
      }
    }

    Future.delayed(const Duration(milliseconds: settingsButtonDelayMilliseconds), () {
      setStateCallback();
      showTooltip = false;
    });
  }

  void handlePopupMenuCanceled(VoidCallback setStateCallback) {
    setStateCallback();
    showTooltip = true;

    Future.delayed(const Duration(milliseconds: settingsButtonDelayMilliseconds), () {
      setStateCallback();
      showTooltip = false;
    });
  }
}
