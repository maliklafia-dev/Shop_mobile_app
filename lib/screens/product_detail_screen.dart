import 'package:flutter/material.dart';
import 'package:store/widgets/common/appbar_widget.dart';
import 'package:store/widgets/home/product_detail/product_detail_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(),
      /* 
        si l'écran est superposé, si le drawer n'est pas présent, une flèche de retour va apparaître
        //drawer: DrawerWidget()
      */
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductDetailwidget(),
          ],
        ),
      ),
    );
  }
}
