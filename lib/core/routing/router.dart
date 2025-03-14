import 'package:go_router/go_router.dart';
import 'package:shopware_6/core/routing/route_names.dart';
import 'package:shopware_6/feature_products/presentation/ui/products_screen.dart';

final router = GoRouter(
  initialLocation: RouteNames.products,
  routes: [
    GoRoute(
      path: RouteNames.products,
      name: RouteNames.products,
      builder: (context, state) => const ProductsScreen(),
    ),
  ],
);
