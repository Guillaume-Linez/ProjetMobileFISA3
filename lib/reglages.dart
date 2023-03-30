import 'package:flutter/material.dart';

class Reglages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFAE0000), // Ajout de la couleur de fond
        body: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.save),
              title:Text("Sauvegarder la partie"),
              trailing: Icon(Icons.more_vert),
            ),
          ],
        ),
    );
  }
}