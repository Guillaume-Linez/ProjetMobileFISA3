//créer une page qui contient un titre : Regles de jeu
//qui contient 3 sous-titre avec une paragraphe chacun
import 'package:flutter/material.dart';

class ReglesDeJeu extends StatelessWidget {
  const ReglesDeJeu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFAE0000), // Ajout de la couleur de fond
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left:20, top:50),
            child : Row(
              children: [
                IconButton( // Ajout d'un bouton retour
                  icon: const Icon(Icons.arrow_circle_left),
                  iconSize: 30,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                
              ],
            ),
          ),

          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Masyu',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontFamily: 'Public Pixel',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const Row(
            children:  <Widget>[
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    '\nRègles du jeu : \n\nObjectif:\ncréer une boucle unique qui passe par tous les pions \n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'Free Pixel',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const Row(
            children:  <Widget>[
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Contraintes sur les pions :',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'Free Pixel',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(left: 35.0),
                  child: Text(
                    '\nUn pion est obligatoirement relié à deux branches.\n\nLes traits ne doivent pas se croiser.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: 'Free Pixel',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(left: 35.0),
                  child: Text(
                    '\nLes pions blancs sont traversés par un trait droit.\n\nSi on croise un pion blanc, on doit tourner dans au moins une des cellules voisines.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'Free Pixel',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(left: 35.0),
                  child: Text(
                    '\nLes pions noirs sont traversés par un angle droit.\n\nLes branches doivent rester droites dans au moins deux cellules qui succèdent.',
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Free Pixel',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
