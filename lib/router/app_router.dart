import 'package:go_router/go_router.dart';
import 'package:plants_app/core/models/plant_item_model.dart';
import 'package:plants_app/presentation/screens/home_screen.dart';
import 'package:plants_app/presentation/screens/product_detail_screen.dart';
import 'package:plants_app/providers/home_provider.dart';
import 'package:provider/provider.dart';

GoRouter router = GoRouter(
    initialLocation: NamedRoutes.home.routeName,
    routes: [
      GoRoute(path: NamedRoutes.home.routeName, builder: (ctx, state) => ChangeNotifierProvider(
        create: (_) => HomeProvider(),
        builder: (_, child) => HomeScreen()
      )),
      GoRoute(path: NamedRoutes.productDetail.routeName, builder: (_, state) => ProductDetailScreen(plant: state.extra as PlantItemModel))
    ],
);

enum NamedRoutes {
  home('/home'),
  productDetail('/product-detail')
  ;

  final String routeName;
  const NamedRoutes(this.routeName);
}