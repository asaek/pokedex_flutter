import 'package:examen_poke_api/domain/entities/entitites.dart';
import 'package:examen_poke_api/presentation/providers/pokedex/pokedex_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pokemonsListProvider =
    StateNotifierProvider<PokedexNotifier, List<Pokemon>>((ref) {
  final fetchPokemons = ref.watch(pokemonRepositoryProvider).getPokemons;

  return PokedexNotifier(callback: fetchPokemons);
});

typedef PokedexCallback = Future<List<Pokemon>> Function(
    {int cantidadPokemons});

class PokedexNotifier extends StateNotifier<List<Pokemon>> {
  int cantidadPokemons = 0;
  bool isLoading = false;
  final PokedexCallback callback;

  PokedexNotifier({required this.callback}) : super([]);

  void sortPokemonsAlfabeticamente() {
    final List<Pokemon> pokemonsAlfabeticos = List<Pokemon>.from(state)
      ..sort((a, b) => a.nombre.compareTo(b.nombre));
    state = pokemonsAlfabeticos;
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    cantidadPokemons += 40;
    final List<Pokemon> pokemonList =
        await callback(cantidadPokemons: cantidadPokemons);
    state = [...state, ...pokemonList];
    isLoading = false;
  }
}
