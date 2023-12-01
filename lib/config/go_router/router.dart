import 'package:examen_poke_api/presentation/pages/pages.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: PokedexPage.routerName,
      path: '/',
      builder: (context, state) => const PokedexPage(),
    ),
    GoRoute(
      name: PokemondetailsPage.routerName,
      path: '/pokemon_details',
      builder: (context, state) => const PokemondetailsPage(),
    ),
  ],
);
