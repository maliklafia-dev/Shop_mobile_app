import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product.dart';
import 'package:store/providers/product_provider.dart';

// ignore: must_be_immutable
class ProductItemGrid extends StatelessWidget {
  // récupérer le produit envoyé par la grille

  Product product;
  ProductItemGrid({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          product.image,
          height: 100,
          fit: BoxFit.contain,
        ),
        SizedBox(
          height: 35,
          child: Text(
            product.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text('${product.price} €'),
        OutlinedButton(
          onPressed: () {
            //naviguer vers un écran
            context.pushNamed('product-details');
            context.read<ProductProvider>().product = product;
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.lightGreen,
            foregroundColor: Colors.white,
            side: BorderSide.none,
          ),
          child: const Text('View more'),
        )
      ],
    );
  }
}
