// languages_implementation.dart
// The file implements the functionality for the change of languages and its corresponding pop-up.
// (main.dart) -> (settings_functionality.dart) -> .

import "package:flutter/material.dart";
import "package:keepitez/language_data.dart";

Future<void> showLanguagesPopup(BuildContext context, LanguageOption? selectedLanguage, ValueChanged<LanguageOption> onLanguageSelected) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: const Color.fromRGBO(249, 249, 224, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(
            color: Color.fromRGBO(0, 128, 128, 1),
          ),
        ),
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: languageOptions.entries.map((entry) {
                    return RadioListTile<LanguageOption>(
                      value: entry.key,
                      groupValue: selectedLanguage,
                      title: Text(
                        entry.value,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(0, 77, 64, 1)
                        ),
                      ),
                      activeColor: const Color.fromRGBO(0, 128, 128, 1),
                      onChanged: (LanguageOption? value) {
                        if (value != null) {
                          setState(() {
                            selectedLanguage = value;
                          });
                          onLanguageSelected(value);
                        }
                      },
                    );
                  }).toList(),
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
