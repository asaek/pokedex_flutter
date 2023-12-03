import 'package:dio/dio.dart';
import 'package:examen_poke_api/domain/entities/entitites.dart';
import 'package:examen_poke_api/domain/excepciones/excepciones.dart';
import 'package:examen_poke_api/presentation/providers/pokedex/pokedex_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pokemonsListProvider =
    StateNotifierProvider<PokedexNotifier, PokedexState>((ref) {
  final fetchPokemons = ref.watch(pokemonRepositoryProvider).getPokemons;

  return PokedexNotifier(callback: fetchPokemons);
});

typedef PokedexCallback = Future<List<Pokemon>> Function(
    {int cantidadPokemons});

class PokedexNotifier extends StateNotifier<PokedexState> {
  List<Pokemon> _pokemonsBeforeSearch = [];
  int cantidadPokemons = 0;
  bool isLoading = false;
  final PokedexCallback callback;

  PokedexNotifier({required this.callback}) : super(PokedexState.initial());

  void sortPokemonsAlfabeticamente() {
    final List<Pokemon> pokemonsAlfabeticos =
        List<Pokemon>.from(state.pokemons!)
          ..sort((a, b) => a.nombre.compareTo(b.nombre));
    state = PokedexState(
        pokemons: pokemonsAlfabeticos, errorMessage: state.errorMessage);
  }

  void sortPokemonsId() {
    final List<Pokemon> pokemonsId = List<Pokemon>.from(state.pokemons!)
      ..sort((a, b) => a.idPokemon.compareTo(b.idPokemon));
    state =
        PokedexState(pokemons: pokemonsId, errorMessage: state.errorMessage);
  }

  void buscarPokemons({required String nombrePokemon}) {
    final List<Pokemon> pokemonsBuscados =
        buscarPokemonPorNombre(_pokemonsBeforeSearch, nombrePokemon);
    state = PokedexState(
        pokemons: pokemonsBuscados, errorMessage: state.errorMessage);
  }

  List<Pokemon> buscarPokemonPorNombre(
      List<Pokemon> listaOriginal, String nombreBusqueda) {
    return listaOriginal.where((pokemon) {
      return pokemon.nombre
          .toLowerCase()
          .contains(nombreBusqueda.toLowerCase());
    }).toList();
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    cantidadPokemons += 25;
    try {
      final List<Pokemon> pokemonList =
          await callback(cantidadPokemons: cantidadPokemons);
      if (state.pokemons == null) {
        state = PokedexState(
          pokemons: [...pokemonList],
          errorMessage: state.errorMessage,
        );
      } else {
        state = PokedexState(
          pokemons: [...state.pokemons!, ...pokemonList],
          errorMessage: state.errorMessage,
        );
      }
      // throw DioException(
      //   requestOptions: RequestOptions(path: 'forced exception path'),
      //   error: 'Forced DioException',
      // );
      // throw const FormatException('Forced FormatException');

      _pokemonsBeforeSearch = state.pokemons!;
    } catch (e) {
      if (e is NetworkException || e is DioException) {
        state = PokedexState(
            pokemons: state.pokemons, errorMessage: 'Error de conexion');
      } else {
        state = PokedexState(
            pokemons: state.pokemons,
            errorMessage: 'Error al procesar los pokemons');
      }
    } finally {
      isLoading = false;
    }
  }
}
