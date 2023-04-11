import 'package:flutter/material.dart';
import 'barre.dart';
import 'shape_custom.dart';
import 'dart:math';
import 'globals.dart' as globals;

int taille = 6;
// List<List<int>> matrice = List.empty();

class GrilleDuJeu extends StatefulWidget {
  @override
  _GrilleDuJeuState createState() => _GrilleDuJeuState();
}

class _GrilleDuJeuState extends State<GrilleDuJeu> {
  // globals.matrice = List.generate(taille, (_) => List.generate(taille, (_) => 0));
  int randomInt = Random().nextInt(3);

  @override
  Widget build(BuildContext context) {
    List<List<Map<String, int>>> tableau = List.generate(
      taille,
      (_) => List.generate(
        taille,
        (_) => {"x": 0, "y": 0, "typePion": 0, "barre1": 1, "barre2": 1},
      ),
    );
    globals.matrice = tableau;
    for(int x=0; x<taille; x++){
      for(int y=0; y<taille; y++){
        globals.matrice[x][y] = {
          "x":x,
          "y":y,
          "typePion":0,
          "barre1":0,
          "barre2":0
        };
      }
    }
    print(globals.matrice);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Masyu'),
      ),
      body: Center(
        child:Column(
          children: [Container(
            height: MediaQuery.of(context).size.width*0.8,
            width: MediaQuery.of(context).size.width*0.8,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            child: Column(
              children: [
                for (int i=0; i<taille*2; i++)
                  Expanded(
                    child: Row(
                      children: (i/2 == (i/2).floor()) ? [
                        for (int j=0; j<taille*2; j++)
                          Expanded(child:
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: (j/2 == (j/2).floor()) ? [
                                Pion(height: 20, width: 20, type: 1, x: i, y: (j/2).floor()),
                              ] : [
                                Barre(height: 30, width: 20, type: 1, x: i, y: j, taille: taille,),
                              ]),
                          ),
                      ] : [
                        for (int j=0; j<taille*2; j++)
                          Expanded(child:
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Barre(height: 20, width: 20, type: 1, x: i, y: j, taille: taille,),
                              ]),
                          ),
                      ],
                    ),
                  )
              ],
            ),
          ),
          TextButton(
            onPressed: VerifGrille,
            child: const Text('Verification de la grille'),
          )],
        ),
      )
    );
  }

  void VerifGrille(){
    print(globals.matrice);
  }

}
