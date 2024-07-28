// settings_functionality.dart
// This file implements the functionalities of the 'Settings' button.
// (main.dart) -> .

import "package:flutter/material.dart";
import "package:keepitez/languages_implementation.dart";
import "package:keepitez/language_data.dart";
import "package:keepitez/global_settings.dart";

// Define the enum for settings options
enum SettingOption { option1, option2, option3 }

const int settingsButtonDelayMilliseconds = 220;

class SettingsFunctionality {
  bool showTooltip = false;
  SettingOption? selectedOption;
  LanguageOption? selectedLanguage = LanguageOption.english; // Default language

  // Define the options for the popup menu
  // Note: moved it inside so that the map is now a class getter, ensuring it always fetches the latest language data.
  //       Also, I removed the 'final' because we don't want a final Map, but a getter (becareful of the syntax).
Map<SettingOption, String> get settingOptions => {
  SettingOption.option1: LanguageData.getText("setting1"), // Themes
  SettingOption.option2: LanguageData.getText("setting2"), // Languages
  SettingOption.option3: LanguageData.getText("setting3"), // Exit (pretty much useless)
};

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
