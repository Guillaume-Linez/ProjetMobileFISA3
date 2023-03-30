import 'package:flutter/material.dart';
import 'barre.dart';
import 'shape_custom.dart';
import 'dart:math';

class GrilleDuJeu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int taille = 6;
    Random random = Random();
    int randomInt = random.nextInt(3);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Masyu'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.width*0.8,
          width: MediaQuery.of(context).size.width*0.8,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
          ),
          child: 
            Row(children: [
              for (int i=0; i<taille; i++)
                Column(
                  children: [
                for (int j=0; j<taille; j++)
                      Row(
                        children: [
                        SizedBox(width: MediaQuery.of(context).size.width*0.020, height: MediaQuery.of(context).size.width*0.020),
                        Barre(height: 20, width: 20, type: 1, x: i, y: j),
                        Pion(height: 20, width: 20, type: 1, x: i, y: j),
                        SizedBox(width: MediaQuery.of(context).size.width*0.020, height: MediaQuery.of(context).size.width*0.020),
                      ]),
                ],),
            ],)
          ),
      ),
    );
  }
}