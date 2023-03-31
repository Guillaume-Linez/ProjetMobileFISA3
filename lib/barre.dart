import 'package:flutter/material.dart';
import 'dart:math';

class Barre extends StatelessWidget {
  final double width;
  final double height;
  final int type;
  final int x;//donne les coordonnées pour insérer les lignes
  final int y;//donne les coordonnées pour insérer les lignes
  final int taille;

  Barre({this.width = 100, this.height = 100, required this.type, this.x = 0, this.y = 0, this.taille=3});

  @override
  Widget build(BuildContext context) {
    Color customColor;
    if(type == 1){
      customColor = Color.fromARGB(255, 0, 0, 0);
    }else{
      customColor = Color.fromARGB(255, 255, 255, 255);
    }
    int typetmp = Random().nextInt(3);
    if(x/2 == (x/2).floor()){
      if(y < taille*2-1){
        print("barre taille = $taille");
        print("barre x = $x");
        print("barre y = $y");
        return Stack(children: [
            Positioned(
              child: 
              Container(
                width: width,
                height: height/5,
                decoration: BoxDecoration(
                  color: customColor
                ),
              ),
            ),
          ],);
      }
    }else{
      if(y < taille*2-1 && y/2 == (y/2).floor()){
        print("barre taille = $taille");
        print("barre x = $x");
        print("barre y = $y");
        return Stack(children: [
            Positioned(
              child: 
              Container(
                width: width/5,
                height: height,
                decoration: BoxDecoration(
                  color: customColor
                ),
              ),
            ),
          ],);
      }
    }
      
    return Row();
  }
}