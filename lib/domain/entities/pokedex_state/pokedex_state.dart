import 'package:examen_poke_api/domain/entities/entitites.dart';

class PokedexState {
  List<Pokemon>? pokemons;
  String? errorMessage;

  PokedexState({required this.pokemons, this.errorMessage});

  factory PokedexState.initial() => PokedexState(pokemons: null);
}
