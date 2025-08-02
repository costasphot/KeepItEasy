// src/widgets/add_note_button.dart
// This file initializes a custom button widget.

import "package:flutter/material.dart";
import "package:keepitez/src/language_data.dart";

class AddNoteButton extends StatelessWidget {
  final GestureTapCallback onPressed;

  const AddNoteButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: Colors.deepOrange,
      splashColor: Colors.orange,
      shape: const StadiumBorder(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              Icons.explore,
              color: Colors.amber,
            ),
            const SizedBox(width: 4.0),
            Text(
              LanguageData.getText("addNote"),
              style: const TextStyle(color: Colors.white)
            ),
          ],
        ),
      ),
    );
  }

}