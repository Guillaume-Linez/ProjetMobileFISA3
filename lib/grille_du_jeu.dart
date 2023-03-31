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
            Column(
              children: [
              for (int i=0; i<taille*2; i++)
              Expanded(
                child: 
              Row(
                  children: (i/2 == (i/2).floor()) ? [
                for (int j=0; j<taille*2; j++)
                    Expanded(child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: (j/2 == (j/2).floor()) ? [
                          Pion(height: 20, width: 20, type: 1, x: i, y: (j/2).floor()),
                        ] : [
                          Barre(height: 20, width: 20, type: 1, x: i, y: j, taille: taille,),
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
                ],),
              )
            ],)
          ),
      ),
    );
  }
}