import 'package:flutter/material.dart';
import 'package:store/models/product.dart';

class CartProvider extends ChangeNotifier {
  //stocker un produit
  final List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }
}
