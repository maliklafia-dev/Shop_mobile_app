class Product {
  // constructeur
  /* 
    {} : créer des paramètres nommés
    this : paramètre promu
    required : paramètre obligatoire
  */
  int id;
  String title, description, category, image;
  num price;
  Map rating;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
    required this.price,
    required this.rating,
  });
}
