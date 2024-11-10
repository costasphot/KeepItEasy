// main.dart
// This is the main file.
// . (main)

import "package:flutter/material.dart";
import "dart:math";
import "package:keepitez/notes_functionality.dart";
import "package:keepitez/settings_functionality.dart";
import "package:keepitez/global_settings.dart";
import "package:keepitez/language_data.dart";
import "package:keepitez/timer_functionality.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GlobalSettings().initialize();
  runApp(MaterialApp( // Removed 'const' from here because the theme cannot be a constant
    home: const KeepItEz(),
    debugShowCheckedModeBanner: false,
    theme: GlobalSettings.themeData, // Use global theme
    // TODO: learn more about the theme
  ));
}

class KeepItEz extends StatefulWidget {
  const KeepItEz({super.key});

  @override
  State<KeepItEz> createState() => _KeepItEzState();
}

class _KeepItEzState extends State<KeepItEz> {
  String titleName = "";
  final SettingsFunctionality settingsFunctionality = SettingsFunctionality();

  @override
  Widget build(BuildContext context) {
    // Initialize MediaQueryData
    GlobalSettings.initializeMediaQuery(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 128, 128, 1),
        foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
        leading: IconButton(
          onPressed: () {
            TimerFunctionality().showTimerDialog(context);
          },
          tooltip: LanguageData.getText("timer"),
          icon: const Icon(Icons.timer),
        ),
        title: Stack(
          alignment: Alignment.center,
          children: [
            // Centered title
            const Text(
              "KeepItEasy",
              textAlign: TextAlign.center,
            ),
            // Timer display aligned to the left
            Align(
              alignment: Alignment.centerLeft,
              child: ValueListenableBuilder<String>(
                valueListenable: TimerFunctionality.timerDisplay,
                builder: (context, value, child) {
                  return value.isNotEmpty
                      ? GestureDetector(
                          onTap: () {
                            TimerFunctionality().showTimerControlDialog(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onPrimaryContainer,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 50, maxHeight: 50),
              child: Tooltip(
                message: settingsFunctionality.showTooltip ? "" : LanguageData.getText("settings"),
                child: PopupMenuButton<SettingOption>(
                  onSelected: (value) {
                    settingsFunctionality.handleSettingOptionChange(
                      context,
                      () => setState(() {}) /* Current state to be used in the 'setState' method; value passed: _KeepItEzState */,
                      // Also refreshes state to update language-dependent items
                      value
                    );
                  },
                  onCanceled: () {
                    settingsFunctionality.handlePopupMenuCanceled(
                      () => setState(() {})
                      // Same here
                    );
                  },
                  itemBuilder: (BuildContext context) {
                    return settingsFunctionality.settingOptions.entries.map((entry) {
                      return PopupMenuItem<SettingOption>(
                        value: entry.key,
                        child: Text(
                          entry.value,
                          style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }).toList();
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  elevation: 20,
                  tooltip: "", // PopupMenuButton normally has a default tooltip of "Show Menu"
                  offset: Offset.fromDirection(pi / 2, 48),
                  color: const Color.fromRGBO(0, 128, 128, 1),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromRGBO(249, 249, 224, 1), // Soft Cream
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 45.0,
        height: 45.0,
        child: FloatingActionButton(
          onPressed: () {
            showNoteStartup(context, titleName);
          },
          tooltip: LanguageData.getText('addNote'),
          backgroundColor: const Color.fromRGBO(0, 77, 64, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          child: const Icon(
            Icons.add,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
      ),
    );
  }
}
