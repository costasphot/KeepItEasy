import 'package:flutter/material.dart';
// import './components.dart';

void main() {
  runApp(const MaterialApp(
    home: KeepItEz(),
    debugShowCheckedModeBanner: false
  ));
}

class KeepItEz extends StatefulWidget {
  const KeepItEz({super.key});

  @override
  State<KeepItEz> createState() => _KeepItEzState();
}

class _KeepItEzState extends State<KeepItEz> {
  String titleName = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(0, 128, 128, 1), // A little bit darker than Colors.teal
          foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
          leading: IconButton(
            icon: const Icon(Icons.timer),
            onPressed: () {
              // Add timer functionality
            },
          ),
          title: const Text("KeepItEz", style: TextStyle(fontWeight: FontWeight.w500)),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Add settings functionality
              }
            ),
          ],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color.fromRGBO(245, 245, 220, 1), // Soft Cream
          child: Column(
            children: [
              const Text(
                "Main Container content here",
                style: TextStyle(
                  color: const Color.fromRGBO(0, 77, 64, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ]
          )
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: IconButton(
          onPressed: () {
            showNoteStartup(context, titleName);
          },
          icon: const Icon(Icons.add),
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(0, 77, 64, 1)), // Dark Teal
            iconColor: WidgetStatePropertyAll(Color.fromRGBO(255, 255, 255, 1)),
          ),
        ),
      )
    );
  }
}

Future<void> showNoteStartup(BuildContext context /* Instance */, String titleName) /* Threads (run on its own/run in parallel with the program) */ {
  TextEditingController controller = TextEditingController();
  dynamic userInput;

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 40,
        child: AlertDialog(
          backgroundColor: const Color.fromARGB(255, 170, 180, 255),
          content: Column(
            mainAxisSize: MainAxisSize.min, // Ensures the dialog fits its content
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  "Enter note title:",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  )
                )
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: "My Diary",
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.445),
                  )
                ),
                controller: controller,
                maxLength: 26,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton( // Cancel Button
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancel"),
                  ),
                  TextButton( // Confirm Button
                    onPressed: () {
                      titleName = controller.text;
                      if (titleName != "") {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NewNote(titleName: titleName)));
                      }
                    },
                    child: const Text("Confirm"),
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

  const NewNote({super.key, required this.titleName});

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  late TextEditingController titleController, noteController;
  // dynamic userInput; // Storing it in a .json file with its corresponding title
  late String title;
  bool isEditingTitle = false;

  @override
  void initState() {
    super.initState();
    title = widget.titleName;
    titleController = TextEditingController(text: title);
    noteController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  void toggleEditTitle() {
    setState(() {
      if (isEditingTitle) {
        // Save the changes
        title = titleController.text;
      }
      isEditingTitle = !isEditingTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 128, 128, 1),
        foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: "Go Back",
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: isEditingTitle
            ? TextField(
                controller: titleController,
                autofocus: true, // I think the Android keyboard will show when you'll attempt to edit the title (press the edit button)
                style: const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 20.75,
                ), // WATCH THIS WEIGHT
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
              ),
            ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: toggleEditTitle,
              tooltip: isEditingTitle ? "Save Title" : "Edit Title",
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
                decoration: const InputDecoration(
                  hintText: "Date: 25/07/2024\n\nYesterday, I began studying flutter and dart...",
                  hintStyle: TextStyle(
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
                //   // testPopUp(context);
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
