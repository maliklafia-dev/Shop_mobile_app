import 'dart:async';

import 'package:flutter/material.dart';

//Class du widget
class AdsWidget extends StatefulWidget {
  AdsWidget({super.key});
/*
  dart : 
  List : equivalent à un array indicé
  Map : équivalent à un objet JS

  visibilité des membres : 
  pas de protected
  le préfixe "_" : équivalent à private 

*/

// liste de Map
  final List<Map> _items = [
    {
      'img': 'ads1.jpg',
      'text': 'Achetez maintenant ou regrettez toute votre vie'
    },
    {
      'img': 'ads2.jpg',
      'text': 'N\' achetez surtout pas ce produit si non il y aura une ruptutre'
    },
    {
      'img': 'ads3.jpg',
      'text': 'Le meilleur achat que tu aies fait pour ta fille'
    },
  ];

  //indice de la liste
  int _index = 0;

  //minuteur
  // ? : valeur nulle
  Timer? _timer;

  @override
  State<AdsWidget> createState() => _AdsWidgetState();
}

//class de l'état du widget
class _AdsWidgetState extends State<AdsWidget> {
  /* 
    cycle de vie d'un widget
    initState : affichage du widget
    dispose : désaffichage du widget
  */
  @override
  void initState() {
    super.initState();
    widget._timer = Timer.periodic(const Duration(seconds: 1), _setTimer);
  }

  void _setTimer(Timer timer) {
    //setState : permet de modifier un état et de déclencher la mise à jour visuelle du widget
    setState(() {
      widget._index < widget._items.length - 1
          ? widget._index++
          : widget._index = 0;
    });
  }

  @override
  void dispose() {
    //stopper le minuteur
    //null coaslescing :  utilisation ?
    // ! : permet de définir que la valeur n'est pas nulle
    super.dispose();
    widget._timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //widget permet d'accéder à la classe du widget à partir de la classe de l'état du widget
      children: [
        Image.asset('assets/img/${widget._items[widget._index]['img']}'),
        Text(widget._items[widget._index]['text']),
      ],
    );
  }
}
