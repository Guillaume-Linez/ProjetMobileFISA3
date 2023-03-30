import 'package:flutter/material.dart';
import 'dart:math';

class Barre extends StatelessWidget {
  final double width;
  final double height;
  final int type;
  final int x;//donne les coordonnées pour insérer les lignes
  final int y;//donne les coordonnées pour insérer les lignes

  Barre({this.width = 100, this.height = 100, required this.type, this.x = 0, this.y = 0});

  @override
  Widget build(BuildContext context) {
    Color customColor;
    if(type == 1){
      customColor = Color.fromARGB(255, 0, 0, 0);
    }else{
      customColor = Color.fromARGB(255, 255, 255, 255);
    }
    int typetmp = Random().nextInt(3);
      if(x > 0){
        if(y>0){//gauche et haut
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
            Positioned(
              child: 
              Container(
                width: width/5,
                height: height,
                decoration: BoxDecoration(
                  color: customColor
                ),
            ),
            )
          ],);
        }else{//gauche
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
            )
          ],);
        }
      }else{
        if(y>0){//haut
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
            )
          ],);
        }else{
          return Stack();
        }
        return Row();
      }
  }
}