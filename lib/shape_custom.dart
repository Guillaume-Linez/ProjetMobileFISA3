import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:math';
import 'globals.dart' as globals;
import 'grille_du_jeu.dart';

class Pion extends StatelessWidget {
  final double width;
  final double height;
  final int type;
  final int x;//donne les coordonnées pour insérer les lignes
  final int y;//donne les coordonnées pour insérer les lignes
  final String jsonString;

  Pion({this.width = 100, this.height = 100, required this.type, this.x = 0, this.y = 0, this.jsonString=""});

  @override
  Widget build(BuildContext context) {
    Color customColor;
    Color customColorBorder;
    double tailleBordure = width/5;
    int typetmp = globals.getGoodGrid(globals.getSelectedValue(), globals.getSelectedDifficulty(), jsonString)[(x/2).floor()][y];
    print("("+(x/2).floor().toString()+", "+y.toString()+"), type = "+typetmp.toString()+" screensize = "+globals.screenSize.toString());
    //print(jsonDecode(jsonString)[0]['liste'][(x/2).floor()][y]);

    globals.matrice[(x/2).floor()][y]["typePion"] = typetmp;
    if(typetmp == -1){
      customColor = const Color.fromARGB(255, 0, 0, 0);
      customColorBorder = const Color.fromARGB(255, 0, 0, 0);
      // print("Insertion du pion en ($x, $y) de type noir");
      // print(MediaQuery.of(context).size.width*0.8);
      
    }else if(typetmp == 1){
      customColor = Color.fromARGB(255, 255, 255, 255);
      customColorBorder = Color.fromARGB(255, 181, 181, 181);
      // print("Insertion du pion en ($x, $y) de type blanc");
      
    }else{
      customColor = Color.fromARGB(255, 161, 98, 98);
      customColorBorder = Color.fromARGB(255, 255, 255, 255);
      tailleBordure = width/3;
      // print("Insertion du pion en ($x, $y) de type null");
      
    }
    return 
    Positioned(
      top: ((globals.screenSize*0.8)/globals.getSelectedValue() * (x/2).floor() +(globals.screenSize*0.8)/globals.getSelectedValue()/4).toDouble(),
      left: ((globals.screenSize*0.8)/globals.getSelectedValue() * y + (globals.screenSize*0.8)/globals.getSelectedValue()/4).toDouble(),
      child: 
      Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
        color: customColorBorder,
        width: tailleBordure,
        ),
        color: customColor
      ),
    )
    );
  }
}