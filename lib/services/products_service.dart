import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:store/config/config.dart';
import 'package:store/models/product.dart';

class ProductsService {
  /*
    récupérer tous les produits
    Future équivalent des PROMISE en JS 
  */
  Future<List<Product>> getProducts() async {
    //requète en GET
    Uri uri = Uri.parse('${Config.API_URL}/products');
    http.Response res = await http.get(uri);

    //récupérer la réponse
    if (res.statusCode == 200) {
      //convertir les données en JSON
      List data = jsonDecode(res.body);
      return data
          .map((dynamic value) => Product(
              id: value['id'],
              title: value['title'],
              description: value['description'],
              category: value['category'],
              image: value['image'],
              price: value['price'],
              rating: value['rating']))
          .toList();
    }
    //renvoyer une erreur
    else {
      throw Error();
    }
  }
}
