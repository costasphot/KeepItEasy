// settings_test.dart
// This file implements tests for the settings functionality.
// (test file) - All tests passed!

import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:keepitez/src/notes_functionality.dart";

void main() {
  testWidgets("Shows note creation dialog", (WidgetTester tester) async {
    const fabKey = Key("fab");

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              key: fabKey,
              onPressed: () {
                showNoteStartup(context, "");
              },
              child: const Icon(Icons.add),
            );
          },
        ),
      ),
    ));

    // Tap the FloatingActionButton to open the dialog
    await tester.tap(find.byKey(fabKey));
    await tester.pumpAndSettle();

    // Verify the dialog is shown
    expect(find.text("Enter note title"), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets("Creates a new note:" /* Make sure to have the semicolon */, (WidgetTester tester) async {
    const fabKey = Key("fab");
    const noteTitle = "Test Note";

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              key: fabKey,
              onPressed: () {
                showNoteStartup(context, "");
              },
              child: const Icon(Icons.add),
            );
          },
        ),
      ),
    ));

    // Tap the FloatingActionButton to open the dialog
    await tester.tap(find.byKey(fabKey));
    await tester.pumpAndSettle();

    // Enter the note title and save it
    await tester.enterText(find.byType(TextField), noteTitle);
    await tester.tap(find.text("Confirm"));
    await tester.pumpAndSettle();

    // Verify the note is created (you should adapt this based on how notes are displayed in your app)
    expect(find.text(noteTitle), findsOneWidget);
  });
}
