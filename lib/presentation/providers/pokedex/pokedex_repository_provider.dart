import 'package:examen_poke_api/data/datasources/poke_api.dart';
import 'package:examen_poke_api/data/repositories/pokemon_repsoitory_implementation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pokemonRepositoryProvider = Provider((ref) {
  return PokemonRepositoryImplementation(
      pokeApiDataSource: PokedexApiDatasource());
});
