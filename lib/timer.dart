import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'globals.dart' as globals;



class GameTimer extends StatefulWidget {
  const GameTimer({Key? key}) : super(key: key);

  @override
  GameTimerState createState() => GameTimerState();
}



class GameTimerState extends State<GameTimer> {
  int _secondsElapsed = 0;
  late Timer _timer;
  String timerValue='';
  final ValueNotifier<int> timeNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
  _timer = Timer.periodic(Duration(seconds: 1), (timer) {
    if (!mounted) return; // Vérifier si le widget est toujours monté
    setState(() {
      _secondsElapsed++;
      timeNotifier.value = _secondsElapsed;
    });
  });
}




  
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: timeNotifier,
      builder: (context, value, child) {
        return Text(
          '${_getTimeString(value)}',
          style: const TextStyle(
                    fontFamily: 'Public Pixel',
                    fontSize: 20,
                    color: Colors.black,
                  ),
        );
      },
    );
  }


  Future<void> addToSharedPreferencesList(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList(key) ?? [];
    list.add(timerValue);
    await prefs.setStringList(key, list);
  }

  Future<void> stopTimer() async {
    _timer.cancel();
    addToSharedPreferencesList("Historique", _getTimeString(_secondsElapsed));
  }

  String _getTimeString(int timeElapsed) {
    int minutes = _secondsElapsed ~/ 60;
    int seconds = _secondsElapsed % 60;
    timerValue='${globals.getSelectedValueStr()}  <${globals.getSelectedDifficulty()}>  ${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }



}