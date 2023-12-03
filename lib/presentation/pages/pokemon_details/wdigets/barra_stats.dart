import 'package:examen_poke_api/domain/entities/entitites.dart';
import 'package:examen_poke_api/presentation/pages/pokemon_details/wdigets/widgets_pokemon_details.dart';
import 'package:flutter/material.dart';

class BarrasStats extends StatelessWidget {
  const BarrasStats({
    super.key,
    required this.size,
    required this.pokemon,
  });

  final Size size;
  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 15),
      child: SizedBox(
        width: size.width,
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextStat(
                    stat: 'HP',
                    color: pokemon.colorTypePokemon[0],
                  ),
                  TextStat(
                    stat: 'ATK',
                    color: pokemon.colorTypePokemon[0],
                  ),
                  TextStat(
                    stat: 'DEF',
                    color: pokemon.colorTypePokemon[0],
                  ),
                  TextStat(
                    stat: 'SATK',
                    color: pokemon.colorTypePokemon[0],
                  ),
                  TextStat(
                    stat: 'SDEF',
                    color: pokemon.colorTypePokemon[0],
                  ),
                  TextStat(
                    stat: 'SPD',
                    color: pokemon.colorTypePokemon[0],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: SeparadorVertical(height: 120),
            ),
            SizedBox(
              width: size.width * 0.64,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TextStatNumber(stat: pokemon.vida),
                      BarraStat(
                        statBarra: pokemon.vida.toDouble() * 1.65,
                        colorBarra: pokemon.colorTypePokemon[0],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextStatNumber(stat: pokemon.ataque),
                      BarraStat(
                        statBarra: pokemon.ataque.toDouble() * 1.65,
                        colorBarra: pokemon.colorTypePokemon[0],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextStatNumber(stat: pokemon.defensa),
                      BarraStat(
                        statBarra: pokemon.defensa.toDouble() * 1.65,
                        colorBarra: pokemon.colorTypePokemon[0],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextStatNumber(stat: pokemon.especialAtaque),
                      BarraStat(
                        statBarra: pokemon.especialAtaque.toDouble() * 1.65,
                        colorBarra: pokemon.colorTypePokemon[0],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextStatNumber(stat: pokemon.especialDefensa),
                      BarraStat(
                        statBarra: pokemon.especialDefensa.toDouble() * 1.65,
                        colorBarra: pokemon.colorTypePokemon[0],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextStatNumber(stat: pokemon.velocidad),
                      BarraStat(
                        statBarra: pokemon.velocidad.toDouble() * 1.65,
                        colorBarra: pokemon.colorTypePokemon[0],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
