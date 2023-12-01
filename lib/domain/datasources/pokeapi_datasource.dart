import 'package:examen_poke_api/domain/entities/pokemon_entity/pokemon_entity.dart';

abstract class PokeApiDataSource {
  Future<List<Pokemon>> getPokedex({int inicioListPokemons});
}
