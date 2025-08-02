// src/views/home_view.dart
// This file

import 'package:flutter/material.dart';
import "dart:math";
import "package:keepitez/src/notes_functionality.dart";
import "package:keepitez/src/settings_functionality.dart";
import "package:keepitez/src/global_settings.dart";
import "package:keepitez/src/language_data.dart";
import "package:keepitez/src/widgets/add_note_button.dart";

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String titleName = "";
  final SettingsFunctionality settingsFunctionality = SettingsFunctionality();

  @override
  Widget build(BuildContext context) {
    // Initialize MediaQueryData
    GlobalSettings.initializeMediaQuery(context);

    // Calculate 2% padding based on the screen width (used at least twice)
    final double horizontalPadding = MediaQuery.of(context).size.width * 0.02;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // Add timer functionality
          },
          tooltip: LanguageData.getText("timer"),
          icon: const Icon(Icons.timer),
        ),
        title: const Text(
          "KeepItEasy",
          style: TextStyle(fontWeight: FontWeight.w500)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: buildSettingsMenu(),
          ),
        ],
      ),
      body: const SizedBox(
        height: double.infinity,
        width: double.infinity,
          child: Center(
            child: Text(
              "Main Container content here",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AddNoteButton(
              onPressed: () {
                showNoteStartup(context, titleName);
              },
            ),
            const SizedBox(width: 8.0),
            AddNoteButton(
              onPressed: () {
                showNoteStartup(context, titleName);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingsMenu() {
    // Build the PopupMenuButton only once
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 50, maxHeight: 50),
      child: Tooltip(
        message: settingsFunctionality.showTooltip ? "" : LanguageData.getText("settings"),
        child: PopupMenuButton<SettingOption>(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          onSelected: (value) {
            settingsFunctionality.handleSettingOptionChange(
              context,
              () => setState(() {}),
              value
            );
          },
          onCanceled: () {
            settingsFunctionality.handlePopupMenuCanceled(
              () => setState(() {})
            );
          },
          itemBuilder: (BuildContext context) {
            return settingsFunctionality.settingOptions.entries.map((entry) {
              return PopupMenuItem<SettingOption>(
                value: entry.key,
                child: Text(
                  entry.value,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            }).toList();
          },
          icon: const Icon(
            Icons.settings,
          ),
          elevation: 20,
          tooltip: "", // PopupMenuButton normally has a default tooltip of "Show Menu"
          offset: Offset.fromDirection(pi / 2, 48),
        ),
      ),
    );
  }
}
