//import des packages
//bibliothèque materiel : bibliothèque de design de google
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/cart_provider.dart';
import 'package:store/providers/categories_provider.dart';
import 'package:store/providers/product_provider.dart';

import 'package:store/services/router_service.dart';

//fonction main : point d'entrée de l'application
void main() => runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoriesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ], child: const Store()),
    );

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
    //la méthode roouter() est associée au package go_router
    return MaterialApp.router(
      title: "Store",
      //home: HomeScreen());
      //déléguer le routage de l'application au service router
      routerConfig: RouterService.getRouter(),
    );
  }
}
