import 'package:flutter/material.dart';
import 'dart:math';

class Pion extends StatelessWidget {
  final double width;
  final double height;
  final int type;
  final int x;//donne les coordonnées pour insérer les lignes
  final int y;//donne les coordonnées pour insérer les lignes

  Pion({this.width = 100, this.height = 100, required this.type, this.x = 0, this.y = 0});

  @override
  Widget build(BuildContext context) {
    Color customColor;
    Color customColorBorder;
    int typetmp = Random().nextInt(3);
    if(typetmp == 2){
      customColor = const Color.fromARGB(255, 0, 0, 0);
      customColorBorder = const Color.fromARGB(255, 0, 0, 0);
      print("Insertion du pion en ($x, $y) de type noir");
      print(MediaQuery.of(context).size.width*0.8);
      
    }else if(typetmp == 1){
      customColor = Color.fromARGB(255, 255, 255, 255);
      customColorBorder = Color.fromARGB(255, 181, 181, 181);
      print("Insertion du pion en ($x, $y) de type blanc");
      
    }else{
      customColor = Color.fromARGB(255, 255, 255, 255);
      customColorBorder = Color.fromARGB(255, 255, 255, 255);
      print("Insertion du pion en ($x, $y) de type null");
      
    }
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
        color: customColorBorder,
        width: width/5,
        ),
        color: customColor
      ),
    );
  }
}