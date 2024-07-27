// test_and_notes.dart
// This file contains developer notes for frequently used, or interesting stuff; and some test objects for debug purposes.
// . (global file)

import "package:flutter/material.dart";

Future<void> showTestPopup(BuildContext context /* Instance */, String? message) async /* Threads (run on its own/run in parallel with the program) */ {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: message == null ? const Text("Test Popup") : Text(message),
      );
    }
  );
}

// TODO: Fix the 'android' kind of error with the paths

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

/** AppBar Tip
 * Scaffold -> AppBar: 'extendBodyBehindAppBar: true' and then set AppBar's background colour to Colors.transparent
 * Best use case: when there's a background image and the AppBar only helps to add icons, or a title etc
 */

/** Tooltip Widget
 * If any Widget does not provide me with the default tooltip that I might be looking for, I can just wrap my entire Widget with a Tooltip Widget.
 */

/** Question-mark (example)
 * String? name;
 * int? length = name?.length; // If name is null, length will be null instead of throwing an error
 */

// TODO: Think of an example here
/** Exclamation-mark (example)
 * 
 */
