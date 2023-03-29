//créer une page qui contient un titre : Regles de jeu
//qui contient 3 sous-titre avec une paragraphe chacun

import 'package:flutter/material.dart';

class ReglesDeJeu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Règles de jeu'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Règles de jeu',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Règle 1',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Règle 2',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Règle 3',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}