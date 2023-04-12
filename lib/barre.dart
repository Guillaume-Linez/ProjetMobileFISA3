import 'package:flutter/material.dart';
import 'dart:math';
import 'globals.dart' as globals;

class Barre extends StatefulWidget {
  final double width;
  final double height;
  int type;
  final int x; // donne les coordonnées pour insérer les lignes
  final int y; // donne les coordonnées pour insérer les lignes
  final int taille;
  Color customColor = Color.fromARGB(255, 255, 255, 255);

  Barre({this.width = 100, this.height = 100, required this.type, this.x = 0, this.y = 0, this.taille = 3});

  @override
  _BarreState createState() => _BarreState();
}

class _BarreState extends State<Barre> {
  @override
  Widget build(BuildContext context) {
    int typetmp = Random().nextInt(3);
    if (widget.x / 2 == (widget.x / 2).floor() ) {
      if (widget.y < widget.taille * 2 - 1) {
        return GestureDetector(
          onTap: _barreInteraction,
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  padding: const EdgeInsets.all(100),
                  width: widget.width,
                  height: widget.height / 3,
                  decoration: BoxDecoration(color: widget.customColor),
                ),
              ),
            ],
          ),
        );
      }
    } else {
      if (widget.y < widget.taille * 2 - 1 && widget.y / 2 == (widget.y / 2).floor() && widget.x < widget.taille*2-1) {
        // print("barre taille = ${widget.taille}");
        // print("barre x = ${widget.x}");
        // print("barre y = ${widget.y}");
        return GestureDetector(
          onTap: _barreInteraction,
          child :
        Stack(
          children: [
            Positioned(
              child: Container(
                padding: const EdgeInsets.all(100),
                width: widget.width / 3,
                height: widget.height,
                decoration: BoxDecoration(color: widget.customColor),
              ),
            ),
          ],
        ));
      }
    }

    return Row();
  }

  void _barreInteraction() {
    setState(() {
      if (widget.x / 2 == (widget.x / 2).floor() ) {//horizontale donc barre1
        globals.matrice[(widget.x/2).floor()][(widget.y/2).floor()]["barre1"] = widget.type;
        if(widget.type == 0){
          widget.customColor = Color.fromARGB(255, 255, 255, 255);
          widget.type = 1;
        }else{
          widget.customColor = Color.fromARGB(255, 0, 0, 0);
          widget.type = 0;
        }
      }else{//verticale donc barre2
        globals.matrice[(widget.x/2).floor()][(widget.y/2).floor()]["barre2"] = widget.type;
        if(widget.type == 0){
          widget.customColor = Color.fromARGB(255, 255, 255, 255);
          widget.type = 1;
        }else{
          widget.customColor = Color.fromARGB(255, 0, 0, 0);
          widget.type = 0;
        }
      }
    });
  }
}