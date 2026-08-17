import 'package:go_router/go_router.dart';
import 'package:plants_app/presentation/screens/home_screen.dart';
import 'package:plants_app/providers/home_provider.dart';
import 'package:provider/provider.dart';

GoRouter router = GoRouter(
    initialLocation: NamedRoutes.home.routeName,
    routes: [
      GoRoute(path: NamedRoutes.home.routeName, builder: (ctx, state) => ChangeNotifierProvider(
        create: (_) => HomeProvider(),
        builder: (_, child) => HomeScreen()
      ))
    ],
);

enum NamedRoutes {
  home('/home');

  final String routeName;
  const NamedRoutes(this.routeName);
}