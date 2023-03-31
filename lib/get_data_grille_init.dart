class Grille_init {
  String? taille;
  List? liste;

  Grille_init({required this.taille, required this.liste});
  Grille_init.fromJson(Map<String,dynamic> json){
    taille = json['taille'];
    liste = json['liste'];
  }
}