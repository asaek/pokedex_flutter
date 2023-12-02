import 'dart:ui';

class Pokemon {
  final String nombre;
  final int idPokemon;
  final String urlImagen;
  final List<String> tipoClase;
  final int peso;
  final int altura;
  final List<String> movimientos;
  final String descripcion;
  final int vida;
  final int ataque;
  final int defensa;
  final int especialAtaque;
  final int especialDefensa;
  final int velocidad;
  final List<Color> colorTypePokemon;

  Pokemon({
    required this.nombre,
    required this.idPokemon,
    required this.urlImagen,
    required this.tipoClase,
    required this.peso,
    required this.altura,
    required this.movimientos,
    required this.descripcion,
    required this.vida,
    required this.ataque,
    required this.defensa,
    required this.especialAtaque,
    required this.especialDefensa,
    required this.velocidad,
    required this.colorTypePokemon,
  });
}
