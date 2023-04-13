import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyClassement extends StatefulWidget {
  const MyClassement({Key? key});

  @override
  _MyClassementState createState() => _MyClassementState();
}

class _MyClassementState extends State<MyClassement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Classement",style:TextStyle(color: Colors.black,fontFamily: "Pixeloid",fontWeight:FontWeight.bold,fontSize: 35)),
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_circle_left,color: Colors.black),
          iconSize: 30,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<String>>(
        future: getSharedPreferencesList("Historique"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<String> list = snapshot.data!;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Color.fromRGBO(100, 0, 1, 0.3),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(list[index]),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Erreur : ${snapshot.error}",
                style: TextStyle(fontSize: 18),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }



  Future<List<String>> getSharedPreferencesList(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList(key) ?? [];
    return list;
  }
}

