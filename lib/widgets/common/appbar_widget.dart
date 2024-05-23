import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      /* 
        title : titre affiché dans la bare de navigation (testen image ou icône)
        centerTitle : centrer le titre
        leading; regroupement de widgets à gauche de la navigation
        actions: regroupement de widgets à droite de la barre de navigation
      */
      title: const Text(
        'App store',
        style: TextStyle(
            color: Color.fromRGBO(85, 0, 241, 1), fontFamily: 'Nunito'),
      ),
      actions: [
        IconButton(
            onPressed: () {
              /* 
            déboggage : 
            print : Affichage de données simple
            inspect : affichage de données complexes
          */
              print('On pressed');
            },
            icon: const Icon(Icons.person)),
        IconButton(
            onPressed: () {
              /* 
            déboggage : 
            print : Affichage de données simple
            inspect : affichage de données complexes
          */
              print('On pressed');
            },
            icon: const Icon(Icons.shopping_cart))
      ],
      centerTitle: true,
    );
  }

//permet de définir la hauteur de la barre de navigation
  @override
  Size get preferredSize => const Size.fromHeight(55);
}
