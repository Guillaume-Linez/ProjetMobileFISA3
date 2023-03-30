import 'package:flutter/material.dart';

class GrilleDuJeu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Masyu'),
      ),
      body: const Center(
        child: Text('Grille du jeu'),
      ),
    );
  }
}