import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: 'Masyu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
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
            bottom: 110,

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
                onPressed: () {},
                child: const Text(
                  'Start',
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
                onPressed: () {},
                child: const Text(
                  'Classement',
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
          Positioned(
            top: 60,
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
                onPressed: () {},
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
        ],
      ),
    );
  }
}
