import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

List<List<Map<String, int>>> matrice = [];

int selectedButtonIndex = 0;
int selectedDifficulty=0;

List getGoodGrid(int taille, String dificulty, String jsonString){
    List<dynamic> jsonData = jsonDecode(jsonString);
    for(int i=0; i<jsonData.length; i++){
      if(jsonData[i]['taille'] == taille){
        if(jsonData[i]["difficulte"] == dificulty){
          return jsonData[i]['liste'];
        }
      }
    }
    return[];
  }

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

String getSelectedValueStr(){
  switch(selectedButtonIndex)
  {
    case 0:
      return "5x5";
    case 1:
      return "6x6";
    case 2:
      return "7x7";
    case 3:
      return "8x8";
    case 4:
      return "9x9";
    default:
      return "5x5";
  }
}


Future<String> readJson() async {
  String jsonString = await rootBundle.loadString('assets/res/grille.json');
  return jsonString;
}

bool verifierRegles(List<List<Map<String, int>>> grille) {
      int taille = grille.length;
      for (int x = 0; x < taille; x++) {
        for (int y = 0; y < taille; y++) {
          Map<String, int> pion = grille[x][y];
          if (pion['typePion'] != 0) 
          {
            
            int cptVoisin = 0;
            bool virageBlanc = false;
            if(pion['typePion'] == 1)
            {
              //on verifie si le pion est sur un trait
              if(pion['barre1']==1 && pion['barre2']==1)
              {
                print('Le pion : '+pion.toString()+' est un pion blanc et est sur un angle');
                return false;
              }
              if(x>0 && pion['barre1']==1 && (pion['barre2']==1 || grille[x-1][y]['barre2']==1))
              {
                print('Le pion : '+pion.toString()+' est un pion blanc et est sur une intersection');
                return false;
              }
              if(y>0 && pion['barre2']==1 && (pion['barre1']==1 || grille[x][y-1]['barre1']==1))
              {
                print('Le pion : '+pion.toString()+' est un pion blanc et est sur une intersection');
                return false;
              }

              //on verifie si le pion a un voisin qui tourne  avec la barre1
              if(y>0 && pion['barre1']==1 && y<taille-1)
              {
                if(grille[x][y-1]['barre2']==1 || grille[x][y+1]['barre2']==1)
                {
                  virageBlanc=true;
                }
                if(x>0 && x<taille && (grille[x-1][y-1]['barre2']==1 || grille[x-1][y+1]['barre2']==1))
                {
                  virageBlanc=true;
                }
              }
              
              if(x>0 && y>0 && grille[x][y-1]['barre1']==1 && grille[x-1][y]['barre2']==1)
              {
                print('Le pion : '+pion.toString()+' est un pion blanc et est sur une intersection');
                return false;
              }
              //même chose mais pour l'extreme gauche
              if(y==0 && pion['barre2']==1)
              {
                if(x>0 && x<taille-1 && grille[x-1][y]['barre1']==1)
                {
                  virageBlanc=true;
                }
                if(x>0 && x<taille-1 && grille[x+1][y]['barre1']==1)
                {
                  virageBlanc=true;
                }
              }
              //même chose mais pour l'extreme droite
              if(y<=taille-1 && pion['barre2']==1)
              {
                if(x>0 && x<taille-1 && y>0 && grille[x-1][y-1]['barre1']==1)
                {
                  virageBlanc=true;
                }
                if(x>0 && x<taille-1 && y>0 &&grille[x+1][y-1]['barre1']==1)
                {
                  virageBlanc=true;
                }
              }
              
              //on va vérifier la même chose pour barre2 
              if(x>0 && pion['barre2']==1 && x<taille-1)
              {
                if(grille[x-1][y]['barre1']==1 || grille[x+1][y]['barre1']==1)
                {
                  
                  virageBlanc=true;
                }
                if(y>0 && y<taille-1 && (grille[x-1][y-1]['barre1']==1 || grille[x+1][y-1]['barre1']==1))
                {
                  virageBlanc=true;
                }
              }

            
            }

            //on vérifie le Pion NOIR
            if(pion['typePion']==-1)
            {
              virageBlanc=true;
              if(y>0 && y<taille-1 && pion['barre1']==1)
              {
                if(grille[x][y-1]['barre1']==1)
                {
                  print('le pion : '+pion.toString()+' est un pion noir et est sur un trait droit');
                  return false;
                }
                if(grille[x][y+1]['barre1']==0)
                {
                  print('le pion : '+pion.toString()+' est un pion noir et n\'a pas 2 voisins succèssifs');
                  return false;
                }
              }
              if(x>0 && x<taille-1 && pion['barre2']==1)
              {
                if(grille[x-1][y]['barre2']==1)
                {
                  print('le pion : '+pion.toString()+' est un pion noir et est sur un trait droit');
                  return false;
                }
                if(grille[x+1][y]['barre2']==0)
                {
                  print('le pion : '+pion.toString()+' est un pion noir et n\'a pas 2 voisins succèssifs');
                  return false;
                }
              }
              if(x>1 && y>1 && pion['barre1']==0 && pion['barre2']==0)
              {
                if(grille[x-2][y]['barre2']==0 || grille[x][y-2]['barre1']==0)
                {
                  print('le pion : '+pion.toString()+' est un pion noir et n\'a pas 2 voisins succèssifs');
                  return false;
                }
              }
            }

            //on compte le nb voisins
            if(pion['barre1']==1)
            {
              cptVoisin++;
            }
            if(pion['barre2']==1)
            {
              cptVoisin++;
            }
            if(x>0 && grille[x-1][y]['barre2']==1)
            {
              cptVoisin++;
            }
            if(y>0 && grille[x][y-1]['barre1']==1)
            {
              cptVoisin++;
            }

            if(virageBlanc==false)
            {
              print('le pion : '+pion.toString()+' est un pion blanc et n\' pas de virage voisin');
              return false;
            }

            if(cptVoisin != 2)
            {
              print('le pion : '+pion.toString()+' n\'a pas 2 voisins');
              return false;
            }
          }
          if(pion['typePion']==0)
          {
            int cptVoisin=0;

            if(pion['barre1']==1)
            {
              cptVoisin++;
            }
            if(pion['barre2']==1)
            {
              cptVoisin++;
            }
            if(x>0 && grille[x-1][y]['barre2']==1)
            {
              cptVoisin++;
            }
            if(y>0 && grille[x][y-1]['barre1']==1)
            {
              cptVoisin++;
            }


            if(cptVoisin != 2 && cptVoisin != 0)
            {
              print('le pion : '+pion.toString()+' n\'a pas 2 voisins, il a exactement '+cptVoisin.toString()+' voisins');
              return false;
            }

          }

        }
      }
  return true;
}

// Map<String, dynamic> jsonData = await readJson();