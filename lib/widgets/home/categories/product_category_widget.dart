import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product.dart';
import 'package:store/providers/categories_provider.dart';
import 'package:store/services/categories_service.dart';
import 'package:store/widgets/home/product_item_grid.dart';

class ProductCategoryWidget extends StatelessWidget {
  ProductCategoryWidget({super.key});
  //instancier le service
  final CategoriesService _categoriesService = CategoriesService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _categoriesService.getProductsByCatgories(
          context.watch<CategoriesProvider>().categories),
      builder: (context, snapshot) {
        //si les données sont accessibles
        if (snapshot.hasData) {
          //requireData : récupérer les données
          List<Product> data = snapshot.requireData;
          /*  
            définir une hauteur à la grille : 
              shrinkwrap : imbriquer les éléments dans la grille
              itemCount ; nombre d'éléments présents dans la boucle
              physic : 
          */
          return Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                const Text(
                  'Available products',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    //transmettre le produit au widget
                    return ProductItemGrid(product: data[index]);
                  },
                ),
              ],
            ),
          );
        }
        //si les données ne sont pas accessibles
        return const CircularProgressIndicator();
      },
    );
  }
}
