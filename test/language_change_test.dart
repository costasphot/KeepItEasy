// language_change_test.dart
// This file implements tests for the language change functionality.
// (test file) - All tests passed!

import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:keepitez/src/language_data.dart";

void main() {
  group("Language Change Tests", () {
    testWidgets("Change language to Romanian", (WidgetTester tester) async {
      LanguageData.setLanguage("ro");

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(LanguageData.getText("settings")),
          ),
        ),
      ));

      expect(find.text("Setări"), findsOneWidget);
    });

    testWidgets("Change language to Greek", (WidgetTester tester) async {
      LanguageData.setLanguage("gr");

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(LanguageData.getText("settings")),
          ),
        ),
      ));

      expect(find.text("Ρυθμίσεις"), findsOneWidget);
    });
  });
}
