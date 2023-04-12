import 'package:flutter/material.dart';
import 'package:masyu/regles_de_jeu.dart';
import 'afficher_classement.dart';
import 'grille_du_jeu.dart';
import 'globals.dart' as globals;

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
            left: MediaQuery.of(context).size.width / 2 - 105,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: ElevatedButton(
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
            left: MediaQuery.of(context).size.width / 2 - 190,
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                  {
                    return const MyClassement();
                  }));
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
            left: MediaQuery.of(context).size.width / 2 - 120,
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
                  'manuel',
                  style: TextStyle(
                    fontFamily: 'Pixeloid',
                    fontSize: 50,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: globals.selectedButtonIndex == 0 ? Colors.black : Colors.white,
                    onPrimary: globals.selectedButtonIndex == 0 ? Colors.white : Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      globals.selectedButtonIndex = 0;
                    });
                  },
                  child: const Text(
                    '5x5',
                    style: TextStyle(
                      fontFamily: 'Pixeloid',
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: globals.selectedButtonIndex == 1 ? Colors.black : Colors.white,
                    onPrimary: globals.selectedButtonIndex == 1 ? Colors.white : Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      globals.selectedButtonIndex = 1;
                    });
                  },
                  child: const Text(
                    '6x6',
                    style: TextStyle(
                      fontFamily: 'Pixeloid',
                    ),),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: globals.selectedButtonIndex == 2 ? Colors.black : Colors.white,
                    onPrimary: globals.selectedButtonIndex == 2 ? Colors.white : Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      globals.selectedButtonIndex = 2;
                    });
                  },
                  child: const Text(
                    '7x7',
                    style: TextStyle(
                      fontFamily: 'Pixeloid',
                    ),),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: globals.selectedButtonIndex == 3 ? Colors.black : Colors.white,
                    onPrimary: globals.selectedButtonIndex == 3 ? Colors.white : Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      globals.selectedButtonIndex = 3;
                    });
                  },
                  child: const Text(
                    '8x8',
                    style: TextStyle(
                      fontFamily: 'Pixeloid',
                    ),),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: globals.selectedButtonIndex == 4 ? Colors.black : Colors.white,
                    onPrimary: globals.selectedButtonIndex == 4 ? Colors.white : Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      globals.selectedButtonIndex = 4;
                    });
                  },
                  child: const Text(
                    '9x9',
                    style: TextStyle(
                      fontFamily: 'Pixeloid',
                    ),),
                ),
              ],
            ),
            ],
            )
          ),
      ],
      ),
    );
  }
}
