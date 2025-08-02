// src/notes_functionality.dart
// This file implements the entire functionality of the 'Add Note' button and the new notes to be created.
// (main.dart) -> .

import "package:flutter/material.dart";
import "package:keepitez/src/language_data.dart";

Future<void> showNoteStartup(BuildContext context /* Instance */, String titleName) async /* Threads (run on its own/run in parallel with the program) */ {
  TextEditingController controller = TextEditingController();
  // dynamic userInput;

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog( // If I were to add a SizedBox to control the size of AlertDialog as a parent, it would be overriden by
                           // its contents, because that's how AlertDialog works. It often ignores such constraints.
        backgroundColor: const Color.fromRGBO(245, 245, 220, 1),
        content: SingleChildScrollView( // This will never happen in a mobile app. It's only to avoid pixel overflow when resizing
                                         // too small, in a desktop app.
          child: Column(
            mainAxisSize: MainAxisSize.min, // Ensures the dialog fits its content
            children: [
              Container(
                alignment: Alignment.topLeft,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.elliptical(8, 4)),
                  border: Border.symmetric(
                    horizontal: BorderSide.none,
                    vertical: BorderSide.none,
                  ),
                  color: Color.fromRGBO(0, 128, 128, 1),
                ),
                child: Text(
                  "${LanguageData.getText("enterTitle")}:",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  )
                )
              ),
              SingleChildScrollView( // Horizontal scroll if title exceeds fixed size
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: 240,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: LanguageData.getText("enterTitleHint"),
                      hintStyle: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.445),
                      )
                    ),
                    controller: controller,
                    maxLength: 26,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, // Main axis: for a ROW it's HORIZONAL (so left to right) e.g: |---| space |---| space |---|
                children: [
                  TextButton( // Cancel Button
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(LanguageData.getText("cancelTitle")),
                  ),
                  TextButton( // Confirm Button
                    onPressed: () {
                      titleName = controller.text;
                      if (titleName != "") {
                        Navigator.of(context).pop();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NewNote(titleName: titleName)));
                      } // TODO: else -> show an error (maybe)
                    },
                    child: Text(LanguageData.getText("confirmTitle")),
                  )
                ]
              ),
            ],
          ),
        ),
      );
    }
  );
}

class NewNote extends StatefulWidget {
  final String titleName;

  // Constructor that initializes the 'NewNote' widget
  const NewNote({
    super.key, // 'super.key' passes the 'key' parameter to the superclass 'StatefulWidget'
                // 'key' is used by Flutter's framework to manage widget trees efficiently
                 // Using 'super.key' allows us to pass a key to the parent 'StatefulWidget' constructor
    required this.titleName // 'this.titleName' is an initializer that assigns a parameter's value to the class' property
                             // It's also a mandatory parameter when creating an instance of 'NewNote'
  });

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  late TextEditingController titleController, noteController;
  // dynamic userInput; // Storing it in a .json file with its corresponding title
  late String title;
  bool isEditingTitle = false;
  late FocusNode titleFocusNode;

  // Initialize any necessary components (controllers and the class' property)
  @override
  void initState() {
    super.initState();
    title = widget.titleName;
    titleController = TextEditingController(text: title);
    noteController = TextEditingController();
    titleFocusNode = FocusNode();
  }

  // Always dispose resources such as controllers, streams, and subscriptions to avoid memory leaks
  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose(); // Added later
    titleFocusNode.dispose();
    super.dispose();
  }

  void toggleEditTitle() {
    setState(() {
      if (isEditingTitle) {
        // Save the changes
        title = titleController.text;
      } else {
        // Focus on the TextField when entering edit mode
        FocusScope.of(context).requestFocus(titleFocusNode);
      }
      isEditingTitle = !isEditingTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 128, 128, 1), // Teal
        foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: LanguageData.getText("newNoteGoBack"),
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: isEditingTitle
            ? TextField(
                controller: titleController,
                autofocus: true, // I think the Android keyboard will show when you'll attempt to edit the title (press the edit button)
                focusNode: titleFocusNode,
                style: const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 20.75,
                ), // The weights and sizes do not perfectly match, but it's fine
                // TODO: Possible fix -> Check space between words and letters
                decoration: const InputDecoration(
                    border: InputBorder.none,
                ),
                textAlign: TextAlign.center,
              )
            : Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 21,
              ), // The weights and sizes do not perfectly match, but it's fine
            ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: toggleEditTitle,
              tooltip: isEditingTitle ? LanguageData.getText("newNoteSaveTitle") : LanguageData.getText("newNoteEditTitle"),
              icon: Icon(isEditingTitle ? Icons.check : Icons.edit),
            ),
          )
        ]
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0, bottom: 16.0),
        color: const Color.fromRGBO(245, 245, 220, 1),
        child: Column(
          children: [
            Expanded(
              child: TextField( // TODO: Study to implement storing the notes in .json files
                decoration: InputDecoration(
                  hintText: LanguageData.getText("newNoteTextHint"),
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w200,
                    color: Color.fromRGBO(176, 190, 197, 1), // Light Grey
                  ),
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                  color: Color.fromRGBO(0, 77, 64, 1), // Dark Teal
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                // controller: controller,
                // onChanged: (controller) {
                //   userInput = controller;
                //   // showTestPopUp(context);
                // },
                maxLines: null, // Allow unlimited lines
                expands: true, // Makes TextField fill available space
                textCapitalization: TextCapitalization.sentences,
                // keyboardType: TextInputType.multiline,
                // textInputAction: TextInputAction.newline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
