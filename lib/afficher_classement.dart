//create a new widget stateFull called MyClassement

import 'dart:convert';

import 'package:flutter/material.dart';
import 'get_data_classement.dart';
import 'package:flutter/services.dart' as rootBundle;

  Future<List<MyData>> getData() async {
  final jsonData = await rootBundle.rootBundle.loadString('assets/res/classement.json');
  final list = json.decode(jsonData) as List<dynamic>;
  return list.map((e) =>MyData.fromJson(e)).toList();
   
}



class MyClassement extends StatefulWidget {
  const MyClassement({Key? key});

  @override
  _MyClassementState createState() => _MyClassementState();
}
class _MyClassementState extends State<MyClassement> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 227, 227),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_circle_left),
                    iconSize: 30,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Text(
                    " Mon classement",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Public Pixel',
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                ],
              ),
            ),
            const Divider(color: Colors.black),

            
            Expanded(
              child: FutureBuilder<List<MyData>>(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(child: Text("Erreur de chargement"),);
                  } else if (snapshot.hasData) {
                    snapshot.data!.sort((b,a) => b.time!.compareTo(a.time!));
                    return Scrollbar(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text
                              (
                                snapshot.data![index].title!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Public Pixel',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              subtitle: Text
                              (
                                snapshot.data![index].subtitle!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Public Pixel',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              trailing: Text
                              (
                                snapshot.data![index].time!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Public Pixel',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator(),); 
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


