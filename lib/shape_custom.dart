import 'package:flutter/material.dart';
import 'dart:math';

class Pion extends StatelessWidget {
  final double width;
  final double height;
  final int type;

  const Pion({this.width = 100, this.height = 100, required this.type});

  @override
  Widget build(BuildContext context) {
    Color customColor;
    Color customColorBorder;
    int typetmp = Random().nextInt(3);
    if(typetmp == 2){
      customColor = const Color.fromARGB(255, 0, 0, 0);
      customColorBorder = const Color.fromARGB(255, 0, 0, 0);
    }else if(typetmp == 1){
      customColor = Color.fromARGB(255, 255, 255, 255);
      customColorBorder = Color.fromARGB(255, 181, 181, 181);
    }else{
      customColor = Color.fromARGB(255, 255, 255, 255);
      customColorBorder = Color.fromARGB(255, 255, 255, 255);
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