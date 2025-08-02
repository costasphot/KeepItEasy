import "package:flutter/material.dart";

Future<void> showThemeStartup(BuildContext context /* Instance */) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return const AlertDialog(
        title: Text("test"),
      );
    },
  );
}
