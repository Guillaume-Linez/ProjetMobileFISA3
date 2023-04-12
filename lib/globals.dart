import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

List<List<Map<String, int>>> matrice = [];

int selectedButtonIndex = 0;

int getSelectedValue(){
  return selectedButtonIndex+5;
}

Future<String> readJson() async {
  String jsonString = await rootBundle.loadString('assets/res/grille.json');
  return jsonString;
}

// Map<String, dynamic> jsonData = await readJson();