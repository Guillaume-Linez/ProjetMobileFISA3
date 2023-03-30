//créer une page qui contient un titre : Regles de jeu
//qui contient 3 sous-titre avec une paragraphe chacun
import 'package:flutter/material.dart';

class ReglesDeJeu extends StatelessWidget {
  const ReglesDeJeu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFAE0000), // Ajout de la couleur de fond
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left:20, right: 20, top:50),
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
          const Padding(
            padding:  EdgeInsets.only(left:0, right: 0, top:30, bottom: 30),
            child:  Text(
                  'Masyu',
                  style: TextStyle(
                    fontSize: 40,
                     fontFamily: 'Public Pixel',
                    fontWeight: FontWeight.normal,
                  ),
                ),
          ),
          const Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                'Règles du jeu : \n\nObjectif : créer une boucle unique qui passe par tous les pions \n\n',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Public Pixel',
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          const Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                'Contraintes sur les pions :\n',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Public Pixel',
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          const Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, bottom: 20.0),
              child: Text(
                '\nUn pion est obligatoirement relié à deux branches.\n\nLes traits ne doivent pas se croiser.',
                style: TextStyle(
                  //color: Colors.red,
                  fontSize: 14,
                  fontFamily: 'Public Pixel',
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),

          Row(
            children: const <Widget>[
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    '\nLes pions blancs sont traversés par un trait droit.\n\nSi on croise un pion blanc, on doit tourner dans au moins une des cellules voisines.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Public Pixel',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: const <Widget>[
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    '\n\nLes pions noirs sont traversés par un angle droit.\n\nLes branches doivent rester droites dans au moins deux cellules qui succèdent.',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Public Pixel',
                      fontWeight: FontWeight.normal,
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
