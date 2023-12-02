import 'dart:ui';

enum PokemonType {
  normal,
  fighting,
  flying,
  poison,
  ground,
  rock,
  bug,
  ghost,
  steel,
  fire,
  water,
  grass,
  electric,
  psychic,
  ice,
  dragon,
  dark,
  fairy,
  unknown,
  shadow,
}

extension PokemonTypeExtension on PokemonType {
  Color get color {
    switch (this) {
      case PokemonType.normal:
        return const Color(0xffAAA67F);
      case PokemonType.fighting:
        return const Color(0xffC12239);
      case PokemonType.flying:
        return const Color(0xffA891EC);
      case PokemonType.poison:
        return const Color(0xffA43E9E);
      case PokemonType.ground:
        return const Color(0xffDEC16B);
      case PokemonType.rock:
        return const Color(0xffB69E31);
      case PokemonType.bug:
        return const Color(0xffA7B723);
      case PokemonType.ghost:
        return const Color(0xff70559B);
      case PokemonType.steel:
        return const Color(0xffB7B9D0);
      case PokemonType.fire:
        return const Color(0xffF57D31);
      case PokemonType.water:
        return const Color(0xff6493EB);
      case PokemonType.grass:
        return const Color(0xff74CB48);
      case PokemonType.electric:
        return const Color(0xffF9CF30);
      case PokemonType.psychic:
        return const Color(0xffFB5584);
      case PokemonType.ice:
        return const Color(0xff9AD6DF);
      case PokemonType.dragon:
        return const Color(0xff7037FF);
      case PokemonType.dark:
        return const Color(0xff75574C);
      case PokemonType.fairy:
        return const Color(0xffE69EAC);
      case PokemonType.unknown:
        return const Color(0xff68A090);
      case PokemonType.shadow:
        return const Color(0xff000000);
      default:
        return const Color.fromARGB(255, 255, 255, 255);
    }
  }
}
