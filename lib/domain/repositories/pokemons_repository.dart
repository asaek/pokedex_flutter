import 'package:examen_poke_api/domain/entities/pokemon_entity/pokemon_entity.dart';

abstract class PokemonsRepository {
  Future<List<Pokemon>> getPokemons({int cantidadPokemons = 20});
}
