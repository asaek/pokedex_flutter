import 'package:examen_poke_api/domain/datasources/pokeapi_datasource.dart';
import 'package:examen_poke_api/domain/entities/pokemon_entity/pokemon_entity.dart';
import 'package:examen_poke_api/domain/repositories/pokemons_repository.dart';

class PokemonRepositoryImplementation extends PokemonsRepository {
  final PokeApiDataSource pokeApiDataSource;

  PokemonRepositoryImplementation({required this.pokeApiDataSource});

  @override
  Future<List<Pokemon>> getPokemons({int cantidadPokemons = 25}) {
    return pokeApiDataSource.getPokedex(inicioListPokemons: cantidadPokemons);
  }
}
