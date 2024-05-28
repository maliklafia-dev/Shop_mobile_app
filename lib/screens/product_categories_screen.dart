import 'package:flutter/material.dart';
import 'package:store/widgets/common/appbar_widget.dart';
import 'package:store/widgets/home/categories/product_category_widget.dart';

class ProductCategoriesScreen extends StatelessWidget {
  const ProductCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // inspect(categorieService.getProductsByCatgories(
    //     context.watch<CategoriesProvider>().categories));
    return Scaffold(
      appBar: const AppbarWidget(),
      /* 
        si l'écran est superposé, si le drawer n'est pas présent, une flèche de retour va apparaître
        //drawer: DrawerWidget()
      */
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductCategoryWidget(),
          ],
        ),
      ),
    );
  }
}
