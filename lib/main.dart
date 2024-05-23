//import des packages
//bibliothèque materiel : bibliothèque de design de google
import 'package:flutter/material.dart';
import 'package:store/screens/home_screen.dart';

//fonction main : point d'entrée de l'application
void main() => runApp(const Store());

// widget (composant d'interface) Store : représente l'application
class Store extends StatelessWidget {
  const Store({super.key});
  //méthode build permet de définir l'interface visuelle du widget
  /* 
    architecture :
      MaterialApp : représente l'application
        > Scaffold : permet d'architecturer l'application
          > premier écran
    principaux widgets :
      SingleChildScrollView : créer un assenceur
      Row : alignement vertical de plusieurs widget
      Column : alignement verticam de pluisieurs widgets
      Text : affciher une icone
      Image : afficher une image
      OutlineButton : bouton
      Container : div en Html
  */
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "Store", home: HomeScreen());
  }
}
