import 'package:examen_poke_api/data/models/pokemondb/pokemon_pokeapi.dart';
import 'package:examen_poke_api/domain/entities/pokemon_entity/pokemon_entity.dart';

class PokemonMapper {
  static Pokemon pokemonDbResponseToPokemon(
          PokemonDbResponse pokemonDbResponse) =>
      Pokemon(
        nombre: pokemonDbResponse.name,
        idPokemon: pokemonDbResponse.id,
        urlImagen: pokemonDbResponse.sprites.other.officialArtwork.frontDefault,
        tipoClase: pokemonDbResponse.types.map((e) => e.type.name).toList(),
        peso: pokemonDbResponse.weight,
        altura: pokemonDbResponse.height,
        movimientos: pokemonDbResponse.moves.map((e) => e.move.name).toList(),
        descripcion: pokemonDbResponse.species.urlDescripcion,
        vida: pokemonDbResponse.stats[0].baseStat,
        ataque: pokemonDbResponse.stats[1].baseStat,
        defensa: pokemonDbResponse.stats[2].baseStat,
        especialAtaque: pokemonDbResponse.stats[3].baseStat,
        especialDefensa: pokemonDbResponse.stats[4].baseStat,
        velocidad: pokemonDbResponse.stats[5].baseStat,
      );
}
