import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:store/models/categories.dart';
import 'package:store/providers/categories_provider.dart';
//import 'package:store/models/categories.dart';
import 'package:store/services/categories_service.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});
  final CategoriesService _categoriesService = CategoriesService();

  @override
  Widget build(BuildContext context) {
    _categoriesService.getCatgories();
    return Drawer(
      child: Container(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: Column(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CloseButton(),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 500,
              child: FutureBuilder(
                future: _categoriesService.getCatgories(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List? data = snapshot.requireData;
                    Categories iconCategorie = Categories();

                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: iconCategorie.icons[data[index]],
                          onTap: () {
                            context.pushNamed('product-category');
                            context.read<CategoriesProvider>().categories =
                                data[index];
                          },
                          title: Text(data[index]),
                        );
                      },
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
