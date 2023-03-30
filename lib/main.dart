import 'package:flutter/material.dart';
import 'package:masyu/regles_de_jeu.dart';

import 'grille_du_jeu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAE0000),
      body: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: const Text(
              'Masyu',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Public Pixel',
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 130),
            child: Container(
              alignment: Alignment.center,
              child: const Text(
                'ましゅ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Public Pixel',
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 150,
            left: MediaQuery.of(context).size.width * 0.28,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 17.0,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return GrilleDuJeu();
                  }));
                },
                child: const Text(
                  'start',
                  style: TextStyle(
                    fontFamily: 'Pixeloid',
                    fontSize: (50),
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: MediaQuery.of(context).size.width *0.08 ,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 17.0,
                  ),
                ),
                onPressed: () {

                },
                child: const Text(
                  'classement',
                  style: TextStyle(
                    fontFamily: 'Pixeloid',
                    fontSize: 50,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 180,
            left: MediaQuery.of(context).size.width *0.24 ,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 17.0,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const ReglesDeJeu();
                  }));
                },
                child: const Text(
                  'Manuel',
                  style: TextStyle(
                    fontFamily: 'Public Pixel',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        Container(
          padding: EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('5x5'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('6x6'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('7x7'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('8x8'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('9x9'),
              ),
            ],
          ),
        ),
      ],
      ),
    );
  }
}
