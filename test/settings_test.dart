// settings_test.dart
// This file implements tests for the settings functionality.
// (test file)

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keepitez/src/settings_functionality.dart';
import 'package:keepitez/src/language_data.dart';
import "package:keepitez/src/global_settings.dart";

void main() {
  group("Settings Tests", () {
    testWidgets("Open settings and change language", (WidgetTester tester) async {
      final settings = SettingsFunctionality();

      // Step 1: Pump the widget into the tester
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            actions: [
              PopupMenuButton<SettingOption>(
                key: const Key("popupMenuButton"),
                onSelected: (value) {
                  if (GlobalSettings.isDebugMode) {
                    print("Selected option: $value");
                  } // Debug print
                  settings.handleSettingOptionChange(tester.element(find.byKey(const Key("popupMenuButton"))), () {}, value);
                },
                itemBuilder: (BuildContext context) {
                  return settings.settingOptions.entries.map((entry) {
                    return PopupMenuItem<SettingOption>(
                      value: entry.key,
                      child: Text(entry.value),
                    );
                  }).toList();
                },
              )
            ],
          ),
        ),
      ));

      // Step 2: Tap the PopupMenuButton to open the menu
      await tester.tap(find.byKey(const Key("popupMenuButton")));
      await tester.pumpAndSettle();  // Ensure all animations are settled

      // Step 3: Tap the language option
      await tester.tap(find.text(settings.settingOptions[SettingOption.option2]!));
      await tester.pumpAndSettle();  // Ensure all animations are settled

      // Step 4: Print the text for debugging
      final chooseLanguageText = LanguageData.getText("chooseLanguage");
      if (GlobalSettings.isDebugMode) {
        print("Language dialog text: $chooseLanguageText");
      }

      // Step 5: Ensure the language selection dialog is displayed
      await tester.pumpAndSettle();  // Allow time for dialog to appear
      expect(find.text(chooseLanguageText), findsOneWidget);
      expect(find.byType(RadioListTile<LanguageOption>), findsWidgets);

      // Step 6: Change the language to Romanian
      await tester.tap(find.text(languageOptions[LanguageOption.romanian]!));
      await tester.pumpAndSettle();  // Ensure all animations are settled

      // Step 7: Verify the language code is updated
      expect(LanguageData.languageCode, "ro");
    });
  });
}
