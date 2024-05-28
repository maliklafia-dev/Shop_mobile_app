import 'package:flutter/material.dart';
import 'package:store/widgets/common/appbar_widget.dart';
import 'package:store/widgets/common/drawer_widget.dart';
import 'package:store/widgets/home/ads_widget.dart';
import 'package:store/widgets/home/products_grid_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* 
        Scaffold permet d'architecturer l'app
        body : définir le contenu principal
        AppBar : barre de navigation
        Drawer : 
      */
      drawer: DrawerWidget(),
      appBar: const AppbarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [AdsWidget(), ProductsGridWidget()],
        ),
      ),
    );
  }
}
