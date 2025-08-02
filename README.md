# KeepItEasy - Release v0.2.0-alpha

## Overview

This is the third alpha release of the application. I changed the application's structure into something more maintainable and scalable (main -> src/app -> views/home_view). Many performance improvements were also made. This release is intended for testing and feedback purposes only and is not production-ready.

## New Features

- Added themes functionality.

## Bug Fixes

- None

## Performance Improvements

- Made a separate 'build' Widget function for the settings' button (in 'home_view.dart'), so that the whole app doesn't get built everytime the settings button's state is changed.
- Changed all colours from using 'Colors.fromRGBO()' to 'Color.', because I saw that in the documentation, colours from 'Color.' are initialized as static constants, and thus are faster since no function callback is happening, unlike when using 'Colors.fromRGBO()' or 'Colors.fromARGBO()'.

## General/Scalability Improvements

- Changed the entire application's strucutre into something more maintainable and scalable. Separated the entry point/initialization of the app (main.dart) from the GIOREJOGIREJIOGEKGIROIGWOFW (src/app.dart). Also, created different folders for source files, constants, views and widgets. As a result, the home view was transferred from the 'app.dart' to the 'home_view.dart' inside the 'src/views/' directory.
- Created a file for all colours (constants) used inside the app (src/constants/colours.dart).
- Created a file for all themes (src/theme_data.dart).

## Known Issues

- Missing functionalities and/or incomplete features (to-do list, timer, not all languages' translations added yet).

## Future Plans

- Fix the physics of the scroll controller.
- Further development to complete core features (all of the above, keep selected theme, and many more).
- Performance improvements and bug fixes.
- Fix any overflows that may happen (keep the app as safe as possible).
- Work on test files.

## Notes

Adopting the format '**MAJOR.MINOR.PATCH**' ([Semantic Versioning/SemVer](https://semver.org/)).
