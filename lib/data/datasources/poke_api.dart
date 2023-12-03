import 'package:dio/dio.dart';
import 'package:examen_poke_api/data/mappers/pokemon_mapper.dart';
import 'package:examen_poke_api/data/models/models.dart';
import 'package:examen_poke_api/domain/datasources/pokeapi_datasource.dart';
import 'package:examen_poke_api/domain/entities/pokemon_entity/pokemon_entity.dart';
import 'package:examen_poke_api/domain/excepciones/excepciones.dart';

class PokedexApiDatasource extends PokeApiDataSource {
  @override
  Future<List<Pokemon>> getPokedex({int inicioListPokemons = 25}) async {
    final Dio dio = Dio();
    List<Pokemon> pokemons = [];
    try {
      final List<PokemonDbResponse> listPokemons = [];
      int offset = 1;
      if (inicioListPokemons > 25) {
        offset = inicioListPokemons - 24;
      }
      for (int i = offset; i <= inicioListPokemons; i++) {
        final responsePokeApi =
            await dio.get('https://pokeapi.co/api/v2/pokemon/$i/');

        if (responsePokeApi.statusCode == 200 && responsePokeApi.data != null) {
          final PokemonDbResponse pokemonDbResponse =
              PokemonDbResponse.fromJson(responsePokeApi.data);
          //* Solicitud de la descripcion
          final responseDescripcion =
              await dio.get(pokemonDbResponse.species.urlDescripcion);
          listPokemons.add(pokemonDbResponse);
          final DescripcionDbResponse descripcionDbResponse =
              DescripcionDbResponse.fromJson(responseDescripcion.data);

          pokemonDbResponse.species.urlDescripcion = descripcionDbResponse
              .flavorTextEntries[0].flavorText
              .replaceAll('\n', '');
        } else {
          throw NetworkException('Error al obtener los pokemons');
        }
      }
      pokemons = listPokemons
          .map((e) => PokemonMapper.pokemonDbResponseToPokemon(e))
          .toList();
    } catch (e) {
      rethrow;
      // if (e is NetworkException || e is DioException) {
      //   throw NetworkException('Error de conexion');
      // } else {
      //   throw GeneralException('Error al procesar los pokemons');
      // }
    }
    return pokemons;
  }
}
