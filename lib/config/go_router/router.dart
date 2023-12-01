import 'package:examen_poke_api/presentation/pages/pokedex/pokedes_menu.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: PokedexPage.routerName,
      path: '/',
      builder: (context, state) => const PokedexPage(),
    ),
  ],
);
