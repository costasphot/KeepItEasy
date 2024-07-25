import 'package:flutter/material.dart';

Future<void> testPopup(BuildContext context /* Instance */, String message) async /* Threads (run on its own/run in parallel with the program) */ {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: message == null ? const Text("Test Popup") : Text(message),
      );
    }
  );
}

/** My Colours
 * Baby blue: 255, 170, 180, 255
 */

/** Colour Combinations
 * 
 *  1. Teal and Soft Cream
 * AppBar: Teal (#008080 or rgb(0, 128, 128))
 * Background: Soft Cream (#F5F5DC or rgb(245, 245, 220))
 * Text: Dark Teal (#004D40 or rgb(0, 77, 64))
 * Hint Text: Light Grey (#B0BEC5 or rgb(176, 190, 197))
 * Button Background: Teal (#004D40 or rgb(0, 77, 64))
 * Button Symbol: White (#FFFFFF or rgb(255, 255, 255))
 * Icon Background / Letter Color over AppBar: White (#FFFFFF or rgb(255, 255, 255))
 */