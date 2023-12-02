import 'package:dio/dio.dart';
import 'package:examen_poke_api/data/mappers/pokemon_mapper.dart';
import 'package:examen_poke_api/data/models/models.dart';
import 'package:examen_poke_api/domain/datasources/pokeapi_datasource.dart';
import 'package:examen_poke_api/domain/entities/pokemon_entity/pokemon_entity.dart';

class PokedexApiDatasource extends PokeApiDataSource {
  @override
  Future<List<Pokemon>> getPokedex({int inicioListPokemons = 25}) async {
    final Dio dio = Dio();
    List<Pokemon> pokemons = [];
    // Map<String, dynamic> queryParameters = {
    //   'limit': 20,
    // };
    // if (offset != null) {
    //   queryParameters['offset'] = offset;
    // }
    try {
      final List<PokemonDbResponse> listPokemons = [];
      int offset = 1;
      if (inicioListPokemons > 25) {
        offset = inicioListPokemons - 24;
      }
      for (int i = offset; i <= inicioListPokemons; i++) {
        final responsePokeApi =
            await dio.get('https://pokeapi.co/api/v2/pokemon/$i/');
        // print(response.statusCode);
        // print(response.data);
        if (responsePokeApi.statusCode == 200 && responsePokeApi.data != null) {
          // print(response.data);
          final PokemonDbResponse pokemonDbResponse =
              PokemonDbResponse.fromJson(responsePokeApi.data);
          // print(pokemonDbResponse);
          //* Solicitur de la descripcion
          final responseDescripcion =
              await dio.get(pokemonDbResponse.species.urlDescripcion);
          listPokemons.add(pokemonDbResponse);
          final DescripcionDbResponse descripcionDbResponse =
              DescripcionDbResponse.fromJson(responseDescripcion.data);

          pokemonDbResponse.species.urlDescripcion = descripcionDbResponse
              .flavorTextEntries[0].flavorText
              .replaceAll('\n', '');
        } else {
          // print('Error al hacer la peticion');
          // print('${response.statusCode}   Error: ${response.statusMessage}');
        }
      }
      pokemons = listPokemons
          .map((e) => PokemonMapper.pokemonDbResponseToPokemon(e))
          .toList();
    } catch (e) {
      // print(e);
    }
    return pokemons;
  }
}
