import 'package:flutter/material.dart';
import 'package:keepitez/language_data.dart';
import 'package:keepitez/global_settings.dart';
import 'dart:async';

class TimerFunctionality {
  static Timer? _timer;
  static int _remainingSeconds = 0;
  static final ValueNotifier<String> timerDisplay = ValueNotifier<String>('');
  static bool _isPaused = false;

  void showTimerControlDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: GlobalSettings.themeData.dialogBackgroundColor,
          title: Text(
            LanguageData.getText('timerControl'),
            style: TextStyle(
              color: GlobalSettings.themeData.textTheme.titleLarge?.color,
              fontWeight: FontWeight.w500,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(
                  _isPaused ? Icons.play_arrow : Icons.pause,
                  color: GlobalSettings.themeData.textTheme.bodyMedium?.color,
                ),
                title: Text(
                  _isPaused 
                    ? LanguageData.getText('resumeTimer')
                    : LanguageData.getText('pauseTimer'),
                  style: TextStyle(
                    color: GlobalSettings.themeData.textTheme.bodyMedium?.color,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  _togglePause();
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.stop,
                  color: GlobalSettings.themeData.textTheme.bodyMedium?.color,
                ),
                title: Text(
                  LanguageData.getText('stopTimer'),
                  style: TextStyle(
                    color: GlobalSettings.themeData.textTheme.bodyMedium?.color,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  cancelTimer();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _togglePause() {
    if (_isPaused) {
      // Resume timer
      _isPaused = false;
      startTimer(null, _remainingSeconds ~/ 60, resuming: true);
    } else {
      // Pause timer
      _isPaused = true;
      _timer?.cancel();
    }
  }

  void startTimer(BuildContext? context, int minutes, {bool resuming = false}) {
    if (!resuming) {
      _remainingSeconds = minutes * 60;
      _isPaused = false;
    }
    _updateTimerDisplay();
    
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        _updateTimerDisplay();
      } else {
        timer.cancel();
        _isPaused = false;
        timerDisplay.value = '';
        if (context?.mounted ?? false) {
          showDialog(
            context: context!,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: GlobalSettings.themeData.dialogBackgroundColor,
                title: Text(
                  LanguageData.getText('timerComplete'),
                  style: TextStyle(
                    color: GlobalSettings.themeData.textTheme.titleLarge?.color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: GlobalSettings.themeData.textTheme.bodyMedium?.color,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }
      }
    });
  }

  void _updateTimerDisplay() {
    int minutes = _remainingSeconds ~/ 60;
    int seconds = _remainingSeconds % 60;
    timerDisplay.value = '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  static void cancelTimer() {
    _timer?.cancel();
    timerDisplay.value = '';
    _isPaused = false;
  }

  void showTimerDialog(BuildContext context) {
    int minutes = 0;
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: GlobalSettings.themeData.dialogBackgroundColor,
          title: Text(
            LanguageData.getText('setTimer'),
            style: TextStyle(
              color: GlobalSettings.themeData.textTheme.titleLarge?.color,
              fontWeight: FontWeight.w500,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: LanguageData.getText('minutes'),
                  labelStyle: TextStyle(
                    color: GlobalSettings.themeData.textTheme.bodyMedium?.color,
                  ),
                ),
                onChanged: (value) {
                  minutes = int.tryParse(value) ?? 0;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                LanguageData.getText('cancel'),
                style: TextStyle(
                  color: GlobalSettings.themeData.textTheme.bodyMedium?.color,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (minutes > 0) {
                  startTimer(context, minutes);
                }
                Navigator.of(context).pop();
              },
              child: Text(
                LanguageData.getText('start'),
                style: TextStyle(
                  color: GlobalSettings.themeData.textTheme.bodyMedium?.color,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
} 