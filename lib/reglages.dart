import 'package:flutter/material.dart';

class Reglages extends StatefulWidget {
  @override
  _Reglages createState() => _Reglages();
}
class Niveau{
  String nom="";
  int index=0;

  Niveau(String n,int i){
    this.nom=n;
    this.index=i;
  }
}

class _Reglages extends State<Reglages> {
  final List<Niveau> l = <Niveau>[Niveau(' Facile',1),Niveau(' Moyen',2),Niveau(' Difficile',3)];
  late Niveau? dropdownvalue = l[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAE0000),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:1, top:50),
            child : Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_circle_left),
                  iconSize: 40,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  child: Text("Réglages",style: TextStyle(color: Colors.black87,fontSize:50,fontWeight:FontWeight.bold,fontFamily: 'Public Pixel',)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              const Flexible(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Sauvegarder la partie',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize:26,
                      fontWeight:FontWeight.bold,
                      fontFamily: 'Free Pixel',
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.save),
                iconSize: 50,
                onPressed: () {
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text("Choix de la difficulté ",style: TextStyle(color: Colors.black87,fontSize:26,fontWeight:FontWeight.bold,fontFamily: 'Free Pixel',),),
              Flexible(
                flex: 1,
                child: Container(
                  padding:
                  EdgeInsets.symmetric(
                    horizontal: 1.0,
                  ),
                  decoration: BoxDecoration(
                    //border: Border.all(color: Colors.black,width:4,),
                    //borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(100, 0, 1, 0.3),
                  ),
                  child:
                  // Modifier le type générique de 'DropdownButton' pour 'Niveau'
                  DropdownButton<Niveau>(
                    //dropdownColor: Color.fromRGBO(100, 0, 1, 1),
                    dropdownColor: Color(0xFF8B0000),
                    iconEnabledColor: Colors.black87,
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: l.map((niveau) {
                      return DropdownMenuItem<Niveau>(
                        value: niveau,
                        child: Text(niveau.nom,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontFamily: "Free Pixel",),),
                      );
                    }).toList(),
                    onChanged: (Niveau? newValue) {
                      setState(() {
                        dropdownvalue = newValue;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 150,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Positioned(
                bottom: 100,
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
                    onPressed: () {},
                    child: const Text(
                      'Nouvelle partie',
                      style: TextStyle(
                        fontFamily: 'Free Pixel',
                        fontSize: 40,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
