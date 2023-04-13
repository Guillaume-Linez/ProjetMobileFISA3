import 'dart:convert';

import 'package:flutter/material.dart';
import 'get_data_classement.dart';
import 'package:flutter/services.dart' as rootBundle;
Future<List<MyData>> getData() async {
  final jsonData = await rootBundle.rootBundle.loadString('assets/res/grille.json');
  final list = json.decode(jsonData) as List<dynamic>;
  return list.map((e) =>MyData.fromJson(e)).toList();
}