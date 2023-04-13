import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class _GameTimerState {
  StreamSubscription<int>? _timerSubscription;
  int _timeElapsed = 0;
  bool _gameWon = false;
  bool _timerRunning = false;
  int _pause=0;
  @override
  void initState() {
    _startTimer();
  }

  void dispose() {
    _timerSubscription?.cancel();
  }
  void _startTimer() {
    _timerSubscription?.cancel();
    _timerSubscription = Stream.periodic(Duration(seconds: 1), (count) => count + 1)
        .takeWhile((count) => !_gameWon)
        .listen((count) {
    });

  }
  void _stopTimer1() {
    _timerSubscription?.cancel();
  }
  Future<void> addToSharedPreferencesList(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList(key) ?? []; // Obtenez la liste actuelle ou une liste vide si elle n'existe pas encore
    list.add(value); // Ajoutez l'élément à la liste
    await prefs.setStringList(key, list); // Enregistrez la liste mise à jour
  }
  Future<void> _stopTimer() async {
    _timerSubscription?.cancel();
    addToSharedPreferencesList("Historique",_getTimeString(_timeElapsed));
  }
  String _getTimeString(int timeElapsed) {
    int minutes = timeElapsed ~/ 60;
    int seconds = timeElapsed % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
