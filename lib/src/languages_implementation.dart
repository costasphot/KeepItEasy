// languages_implementation.dart
// The file implements the functionality for the change of languages and its corresponding pop-up.
// (main.dart) -> (settings_functionality.dart) -> .

import "package:flutter/material.dart";
import "package:keepitez/src/language_data.dart";
import "package:keepitez/src/constants/colours.dart";

Future<void> showLanguagesPopup(BuildContext context, LanguageOption? selectedLanguage, ValueChanged<LanguageOption> onLanguageSelected) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: const Color.fromRGBO(249, 249, 224, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: AppColours.primaryColour,
          ),
        ),
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            // It's used to control the scroll position of the 'SingleChildScrollView'. This offers more precise control over scrolling.
            final ScrollController scrollController = ScrollController();
            return PopScope(
              onPopInvoked: (bool _) { // Callback now takes a 'bool' parameter, matching the expected signature of 'onPopInvoked'
              // The callback '(bool _)' ignores the 'bool' parameter, which is typical if we don't need to use the parameter.
                scrollController.dispose();
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector( // Detects vertical drag updates and adjusts the scroll position of the 'ScrollController'
                  onVerticalDragUpdate: (details) {
                    // Handle dragging to scroll
                    scrollController.jumpTo(scrollController.position.pixels - details.delta.dy);
                    // The 'jumpTo' method is used to change the scroll position based on the drag details.
                  },
                  child: SingleChildScrollView(
                    controller: scrollController,
                    physics: const ScrollPhysics(parent: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics(), decelerationRate: ScrollDecelerationRate.normal)),
                    scrollDirection: Axis.vertical,
                    reverse: false,
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
                          activeColor: AppColours.primaryColour,
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
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
