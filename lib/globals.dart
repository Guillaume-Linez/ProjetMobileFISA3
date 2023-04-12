import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

List<List<Map<String, int>>> matrice = [];

int selectedButtonIndex = 0;
int selectedDifficulty=0;

int getSelectedValue(){
  return selectedButtonIndex+5;
}

String getSelectedDifficulty()
{
  switch(selectedDifficulty)
  {
    case 0:
      return "facile";
    case 1:
      return "moyen";
    case 2:
      return "difficile";
    default:
      return "facile";
  }
}


Future<String> readJson() async {
  String jsonString = await rootBundle.loadString('assets/res/grille.json');
  return jsonString;
}

// Map<String, dynamic> jsonData = await readJson();