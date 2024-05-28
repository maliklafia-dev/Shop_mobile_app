import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product.dart';
import 'package:store/providers/cart_provider.dart';
import 'package:store/providers/product_provider.dart';

// ignore: must_be_immutable
class ProductDetailwidget extends StatelessWidget {
  const ProductDetailwidget({super.key});

  @override
  Widget build(BuildContext context) {
    Product? product = context.watch<ProductProvider>().product;

    return Column(
      children: [
        Text(
          product!.category,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        Container(
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.contain, image: NetworkImage(product.image)),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          product.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          '${product.price.toStringAsFixed(2)} €',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 25, color: Colors.green),
        ),
        const SizedBox(
          height: 15,
        ),
        RatingStars(
          value: product.rating['rate'],
          starColor: Colors.teal,
        ),
        Text(
          product.description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        OutlinedButton(
          onPressed: () {
            //naviguer vers un écran
            Provider.of<CartProvider>(context, listen: false)
                .addToCart(product);
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.lightGreen,
            foregroundColor: Colors.white,
            side: BorderSide.none,
          ),
          child: const Text('Add to cart'),
        ),
      ],
    );
  }
}
