import 'package:flutter/material.dart';
import 'barre.dart';
import 'shape_custom.dart';
import 'globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class GrilleDuJeu extends StatefulWidget {
  @override
  _GrilleDuJeuState createState() => _GrilleDuJeuState();
}


class _GrilleDuJeuState extends State<GrilleDuJeu> {

  final Future<String> _jsonData = globals.readJson();

  StreamSubscription<int>? _timerSubscription;
  int _timeElapsed = 0;
  bool _gameWon = false;
  bool _timerRunning = false;
  int _pause = 0;
  String _timerValue = 'mm:ss';
  bool _isDarkMode = false;
  Color fond = Colors.white;

  set couleurBarre(couleurBarre) {}


  void _startTimer() {
    _timerSubscription?.cancel();
    _timerSubscription =
        Stream.periodic(Duration(seconds: 1), (count) => count + 1)
            .takeWhile((count) => !_gameWon)
            .listen((count) {});
  }

  void _stopTimer1() {
    _timerSubscription?.cancel();
  }

  Future<void> addToSharedPreferencesList(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList(key) ?? [
    ]; // Obtenez la liste actuelle ou une liste vide si elle n'existe pas encore
    list.add(_timerValue); // Ajoutez l'élément à la liste
    await prefs.setStringList(key, list); // Enregistrez la liste mise à jour
  }

  Future<void> _stopTimer() async {
    _timerSubscription?.cancel();
    addToSharedPreferencesList("Historique", _getTimeString(_timeElapsed));
  }

  String _getTimeString(int timeElapsed) {
    int minutes = timeElapsed ~/ 60;
    int seconds = timeElapsed % 60;
    _timerValue = '${globals.getSelectedValueStr()} <${globals
        .getSelectedDifficulty()}> ${minutes.toString().padLeft(
        2, '0')}:${seconds.toString().padLeft(2, '0')}';
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(
        2, '0')}';
  }


  @override
  Widget build(BuildContext context) {
    globals.screenSize = MediaQuery
        .of(context)
        .size
        .width;

    int taille = globals.getSelectedValue();
    String dificulty = globals.getSelectedDifficulty();
    double heightBarre = 30;
    double widthBarre = 350 / taille;
    Color couleurBarre = Colors.white;
    print(taille);
    List<List<Map<String, int>>> tableau = List.generate(
      taille,
          (_) =>
          List.generate(
            taille,
                (_) =>
            {
              "x": 0,
              "y": 0,
              "typePion": 0,
              "barre1": 1,
              "barre2": 1
            },
          ),
    );
    globals.matrice = tableau;
    for (int x = 0; x < taille; x++) {
      for (int y = 0; y < taille; y++) {
        globals.matrice[x][y] = {
          "x": x,
          "y": y,
          "typePion": 0,
          "barre1": 0,
          "barre2": 0
        };
      }
    }
    print(globals.matrice);
    return Scaffold(
      backgroundColor: fond,
      body: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: FutureBuilder<String>(
              future: _jsonData, // a previously-obtained Future<String> or null
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                List<Widget> children;
                if (snapshot.hasData) {
                  children = [Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .width * 0.8,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Stack(
                      children: [
                        for (int i = 0; i < taille * 2; i++)
                          Container(
                            child: Stack(
                              children: (i / 2 == (i / 2).floor()) ? [
                                // rien
                              ] : [
                                for (int j = 0; j < taille * 2; j++)
                                  Container(
                                    child: Stack(
                                        children: [
                                          Barre(height: widthBarre,
                                            width: heightBarre,
                                            type: 1,
                                            x: i,
                                            y: j,
                                            taille: taille,
                                          customColor: couleurBarre,),
                                        ]),
                                  ),
                              ],
                            ),
                          ),
                        for (int i = 0; i < taille * 2; i++)
                          Container(
                            child: Stack(
                              children: (i / 2 == (i / 2).floor()) ? [
                                for (int j = 0; j < taille * 2; j++)
                                  Container(
                                    child: Stack(
                                        children: (j / 2 == (j / 2).floor()) ? [
                                          //rien
                                        ] : [
                                          Barre(height: heightBarre,
                                            width: widthBarre,
                                            type: 1,
                                            x: i,
                                            y: j,
                                            taille: taille,
                                            customColor: couleurBarre,),
                                        ]),
                                  ),
                                for (int j = 0; j < taille * 2; j++)
                                  Container(
                                    child: Stack(
                                        children: (j / 2 == (j / 2).floor()) ? [
                                          Pion(height: 20,
                                              width: 20,
                                              type: 1,
                                              x: i,
                                              y: (j / 2).floor(),
                                              jsonString: snapshot.data
                                                  .toString()),
                                        ] : [
                                          //rien
                                        ]),
                                  ),
                              ] : [
                                // rien
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                  ];
                }
                else if (snapshot.hasError) {
                  children = <Widget>[
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Error: ${snapshot.error}'),
                    ),
                  ];
                }
                else {
                  children = const <Widget>[
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    ),
                  ];
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: children,
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 110,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: VerifGrille,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: const BorderSide(color: Colors.black),
                  ),
                ),
                child: const Text(
                  'valider',
                  style: TextStyle(
                    fontFamily: 'Free Pixel',
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: Restart,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: const BorderSide(color: Colors.black),
                  ),
                ),
                child: Text(
                  'recommencer',
                  style: TextStyle(
                    fontFamily: 'Free Pixel',
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: (null),
                child: Text(
                  taille.toString() + 'x' + taille.toString(),
                  style: TextStyle(
                    fontFamily: 'Public Pixel',
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1 + 10,
            left: MediaQuery.of(context).size.width * 0.2,
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                color: Colors.yellow,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(50.0),
                onTap: () {
                  // Gérez l'événement onTap ici
                },
                child: const Center(
                  child: Icon(
                    Icons.lightbulb,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            right: MediaQuery.of(context).size.width * 0.2,
            child: Container(
              child: TextButton(
                onPressed: () {
                  ColorMode();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: const BorderSide(color: Colors.black),
                  ),
                ),
                child: Text(
                  'x',
                  style: TextStyle(
                    fontFamily: 'Public Pixel',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void ColorMode(){
    setState(() {
      if(_isDarkMode==false){
        _isDarkMode=true;
        fond = Colors.black;
      }
      else{
        _isDarkMode=false;
        fond = Colors.white;
      }
    });
  }

  void Restart(){
    setState(() {
      couleurBarre = Colors.white;
    });
  }

  void VerifGrille() {
    debugPrint(globals.matrice.toString(), wrapWidth: 1024);
    globals.verifierRegles(globals.matrice);
    if (globals.verifierRegles(globals.matrice)) {
      _stopTimer();
    }
    if (!globals.verifierRegles(globals.matrice)) {
      _stopTimer1();
    }
  }
}
