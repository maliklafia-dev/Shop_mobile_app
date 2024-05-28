import 'package:flutter/material.dart';
import 'package:store/models/product.dart';

class ProductProvider extends ChangeNotifier {
  //stocker un produit
  Product? _product;

  // getter / setter
  Product? get product => _product; //getter qui renvoie la propriété private.

  set product(Product? value) {
    _product = value;
    // NotifyListeners : permet de mettre à jour les écouteurs du provider
    notifyListeners();
  }
}
