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

/** Null-aware operator '?'
 * String? name;
 * int? length = name?.length; // If name is null, length will be null instead of throwing an error
 */

/** Null assertion operator '!'
 * It's used for null safety to assert that a value is non-null. It tells the Dart compiler that we are certain that a particular
 *  variable is not null at a specific point in the code. This is called a null assertion operator. For example:
 * 
 * String? nullableString = "Hello, Flutter!";
 * String nonNullableString = nullableString!; // Asserting that nullableString is not null
 * print(nonNullableString); // Prints: Hello, Flutter!
 */

/** Explanation of: () => setState(() {})
 * 1. () - This denotes an anonymous function with no parameters. They can be inline and have parameters or not.
 * 2. => - It is shorthand for defining a function that contains a single expression. It's called "arrow function" or "fat arrow".
 *          It is a concise way to write functions, especially useful for simple, one-liner functions.
 * 1 + 2. () => (expression) - It means that an anonymous, one-liner function with no parameters is defined, and when called, will
 *                              execute the expression on the right (in our example, setState()).
 * 3. The 'setState' method itself takes a function as its argument. This function should contain the logic for updating the state.
 *     When we pass '() {}' to 'setState', we are providing an empty function that doesn't do anything (no state change), but it
 *     will still trigger a rebuild (the rebuild on its own can be all we want from calling the 'setState' function).
 */

/** Coding examples for the '?' and '!' operators:
 *    Other example, with widgets: Consider a scenario where you have a nullable 'GlobalKey' and you want to access its 'currentState'.
 *     You can use '!' to assert that 'currentState' is not null.
 * 
 *    void submitForm() {
 *      if (formKey!.currentState!.validate()) { // Using ! to assert that formKey and its currentState are not null
 *        formKey.currentState!.save();
 *        // Perform other actions
 *      }
 *    }
 * 
 *    Other example, accessing context in StatefulWidget: when working with 'StatefulWidget', you might want to access the 'BuildContext'
 *     safely. The context is never null within the widget lifecycle methods.
 * 
 *    class MyStfWidget extends StatefulWidget {
 *      @override
 *      _MyStfWidgetState createState () => _MyStfWidgetState();
 *    }
 * 
 *    class _MyStfWidgetState extends State<MyStfWidget> {
 *      @override
 *      Widget build(BuildContext context) {
 *        return Scaffold(
 *          appBar: AppBar(
 *            title: Text("Exclamation Mark Example"),
 *          ),
 *          body: const Center(
 *            child: Text("Hello, Flutter!")
 *          ),
 *        );
 *      }
 * 
 *      void doSomething() {
 *        final scaffoldContext = context; // context is non-null here
 *        // Perform actions with scaffoldContext
 *      }
 *    }
 * 
 *    Other example, initializing non-nullable fields in a class:
 * 
 *  class MyClass {
 *    late final String nonNullableString;
 * 
 *    MyClass(String? nullableString) {
 *      nonNullableString = nullableString!;
 *    }
 *  }
 * 
 *  void main() {
 *    String? nullableString = "Hello, Dart!";
 *    MyClass myClass = MyClass(nullableString);
 *    print(myClass.nonNullableString); // Prints: Hello, Dart!
 *  }
 * 
 *  Other example, accessing a non-nullable property on a nullable object: Suppose we have an object that can be null, but we want to
 *   access a property of that object that we know is not null.
 * 
 *  class User {
 *    String? name;
 *    User(this.name);
 *  }
 * 
 *  void main() {
 *    User? user = User("Alice");
 *    print(user!.name!); // Asserting that user and user.name are not null
 *  }
 */

/** Null-coalescing operator '??'
 * It's used to provide a default value if the expression on its left is 'null'. This is particularly useful in situations where we
 *  want to ensure a non-null value is used, even if the original variable might be 'null'. For example:
 * 
 * var result = expression1 ?? expression2;
 * 
 * expression1: might be null
 * expression2: the expression to use if 'expression1' is null
 * 
 * Other example, assigning default values:
 * 
 * int? a; // it might be null, which is in our case
 * int b = a ?? 10;
 * print(b); // Prints: 10
 * 
 * Other example, chaining with null-aware operator:
 * 
 * class User {
 *   String? name;
 * }
 * 
 * void main() {
 *   User? user;
 *   String userName = user?.name ?? 'Anonymous';
 *   print(userName); // Prints: Anonymous
 * }
 * 
 * Other example, providing default values in functions:
 * 
 * void greet(String? name) {
 *   print("Hello, ${name ?? "Guest"}!");
 * }
 * 
 * void main() {
 *   greet(null); // Prints: Hello, Guest!
 *   greet("Alisa"); // Prints: Hello, Alisa!
 * }
 * 
 * Other example, in a flutter widget (we will ensure that properties have default values):
 * 
 * class MyWidget extends StatelessWidget {
 *   final String? title;
 * 
 *   MyWidget({this.title});
 * 
 *   @override
 *   Widget build(BuildContext context) {
 *     return Scaffold(
 *       appBar: AppBar(
 *         title: Text(title ?? "Default Title"),
 *       ),
 *       body: Center(
 *         child: Text(title ?? "Default Title"),
 *       ),
 *     );
 *   }
 * }
 * 
 * void main() {
 *   runnApp(MaterialApp(
 *     home: MyWidget(), // title is null, so 'Default Title' will be used
 *   ));
 * }
 * 
 * The 'title' property is nullable
 * If 'title' is 'null', the default value 'Default Title' is used in both the 'Appbar' and 'Center'
*/

/** Widget Usage
 * 
 * 1. Expanded cannot be directly used inside a Padding. It needs to be wrapped inside a Flex widget (like Row or Column)
 *  as its direct parent.
 */
