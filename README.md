# KeepItEasy - Release v0.1.1-alpha

## Overview

This is the second alpha release of the application. It mostly contains performance improvements. This release is intended for testing and feedback purposes only and is not production-ready.

## New Features

- Added a GestureDetector and a scroll controller in the languages pop-up so that you can scroll (for future updates, where there will way more languages).
- Timer functionality with pause/resume options

## Bug Fixes

- Prevented pixel overflow when resizing the add-a-note pop-up from a desktop app (doesn't matter in any mobile device).

## Performance Improvements

- Added a controller in the disposal (cleanup) function to avoid any memory leaks.
- Added an observer to observe the app's lifecycle and ensure that if the user or the system suddenly closes/kills the app, the resources will be properly disposed, and also that the app will close fluently.
- Added cross-compatible code (especially in GlobalSettings) so that it works on different desktops and platforms.
- Added configuration for running on different desktops, platforms and also modes (debug/production), in '[launch.json](./.vscode/launch.json)'.
- Added a 'PopScope' so that I can handle the disposal of the scroll controller (in main, it would be handled by the 'dispose' function).

## Known Issues

- Missing functionalities and/or incomplete features (to-do list, timer, not all languages' translations added yet).

## Future Plans

- Fix the physics of the scroll controller.
- Further development to complete core features (all of the above, keep selected theme, and many more).
- Performance improvements and bug fixes.
- Fix any overflows that may happen (keep the app as safe as possible).
- Work on test files.

## Installation
To install and run **KeepItEasy**:
1. **Ensure** you have Flutter installed. [Installation instructions](https://docs.flutter.dev/get-started/install).
2. Clone the repository:
```console
git clone https://github.com/costasphot/KeepItEasy.git
```
3. **Run the app** using Flutter:
```console
flutter run
```
## Notes

Adopting the format '**MAJOR.MINOR.PATCH**' ([Semantic Versioning/SemVer](https://semver.org/)).
