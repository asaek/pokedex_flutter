import 'package:examen_poke_api/domain/entities/entitites.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<Pokemon?> selectedPokemonProvider =
    StateProvider<Pokemon?>((ref) => null);
