import 'package:go_router/go_router.dart';
import 'package:store/screens/cart_screen.dart';
import 'package:store/screens/home_screen.dart';
import 'package:store/screens/product_categories_screen.dart';
import 'package:store/screens/product_detail_screen.dart';
// import 'package:store/widgets/common/drawer_widget.dart';

class RouterService {
  //Lister les routes
  static GoRouter getRouter() {
    return GoRouter(
      routes: [
        GoRoute(
          /*  
            path : schéma web d'une route
            > la route "/" doit exister et est considérée comme la route d'accueil
            name : nom de la route 
          
          */
          path: '/',
          name: 'home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/product-details',
          name: 'product-details',
          builder: (context, state) => const ProductDetailScreen(),
        ),
        GoRoute(
          path: '/product/category',
          name: 'product-category',
          builder: (context, state) => const ProductCategoriesScreen(),
        ),
        GoRoute(
          path: '/product/card',
          name: 'product-card',
          builder: (context, state) => const CartScreen(),
        ),
      ],
    );
  }
}
