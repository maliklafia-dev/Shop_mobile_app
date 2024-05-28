import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store/config/config.dart';
import 'package:store/models/product.dart';

class CategoriesService {
  /*
    récupérer tous les produits
    Future équivalent des PROMISE en JS 
  */
  Future<List> getCatgories() async {
    //requète en GET
    Uri uri = Uri.parse('${Config.API_URL}/products/categories');
    http.Response res = await http.get(uri);

    //récupérer la réponse
    if (res.statusCode == 200) {
      List data = jsonDecode(res.body);
      return data;
    }
    //renvoyer une erreur
    else {
      throw Error();
    }
  }

  Future<List<Product>> getProductsByCatgories(String cat) async {
    //requète en GET
    Uri uri = Uri.parse('${Config.API_URL}/products/category/$cat');
    http.Response res = await http.get(uri);

    //récupérer la réponse
    if (res.statusCode == 200) {
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
