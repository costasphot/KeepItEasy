// main.dart
// This is the main file.

import 'package:flutter/material.dart';
import 'dart:math';

import './notes_functionality.dart';
import './settings_functionality.dart';

void main() {
  runApp(const MaterialApp(
    home: KeepItEz(),
    debugShowCheckedModeBanner: false,
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 128, 128, 1),
        foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
        leading: IconButton(
          onPressed: () {
            // Add timer functionality
          },
          tooltip: "Timer",
          icon: const Icon(Icons.timer),
        ),
        title: const Text("KeepItEz", style: TextStyle(fontWeight: FontWeight.w500)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 50, maxHeight: 50),
              child: Tooltip(
                message: settingsFunctionality.showTooltip ? "" : "Settings",
                child: PopupMenuButton<SettingOption>(
                  onSelected: (value) {
                    settingsFunctionality.handleSettingOptionChange(this, value);
                  },
                  onCanceled: () {
                    settingsFunctionality.handlePopupMenuCanceled(this);
                  },
                  itemBuilder: (BuildContext context) {
                    return settingOptions.entries.map((entry) {
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
        child: Column(
          children: const [
            Text(
              "Main Container content here",
              style: TextStyle(
                color: Color.fromRGBO(0, 77, 64, 1),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: IconButton(
        onPressed: () {
          showNoteStartup(context, titleName);
        },
        tooltip: "Add a note",
        icon: const Icon(Icons.add),
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(0, 77, 64, 1)),
          iconColor: MaterialStatePropertyAll(Color.fromRGBO(255, 255, 255, 1)),
        ),
      ),
    );
  }
}
