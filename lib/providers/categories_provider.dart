import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  //stocker une categorie
  String _categories = '';

  // getter / setter
  String get categories =>
      _categories; //getter qui renvoie la propriété private.

  set categories(String value) {
    _categories = value;
    // NotifyListeners : permet de mettre à jour les écouteurs du provider
    notifyListeners();
  }
}
