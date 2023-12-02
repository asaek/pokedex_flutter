import 'package:examen_poke_api/domain/entities/entitites.dart';
import 'package:examen_poke_api/presentation/providers/providers.dart';
import 'package:examen_poke_api/presentation/tokens/border_radius.dart';
import 'package:examen_poke_api/presentation/tokens/colores.dart';
import 'package:examen_poke_api/presentation/tokens/paddings.dart';
import 'package:examen_poke_api/presentation/tokens/sombras.dart';
import 'package:examen_poke_api/presentation/widgets/common/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PokemondetailsPage extends ConsumerWidget {
  static const routerName = 'pokemon_details';

  const PokemondetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final Pokemon pokemon = ref.watch(selectedPokemonProvider)!;

    return Scaffold(
      backgroundColor: pokemon.colorTypePokemon[0],
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            _Fondo(
              size: size,
              colorFondoBoton: pokemon.colorTypePokemon[0],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 20),
                  child: SizedBox(
                    // height: 100,
                    child: Row(
                      children: [
                        const _BotonBack(),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            pokemon.nombre,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 33,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '#${pokemon.idPokemon.toString()}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: size.width * 0.8,
                  height: size.height * 0.35,
                  child: Image.network(pokemon.urlImagen, fit: BoxFit.cover),
                ),
                const SizedBox(
                  height: 20,
                ),
                // ! falta agregar el tipo de pokemon
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _PokemonType(
                      type: pokemon.tipoClase[0],
                      color: pokemon.colorTypePokemon[0],
                    ),
                    if (pokemon.tipoClase.length > 1)
                      _PokemonType(
                        type: pokemon.tipoClase[1],
                        color: pokemon.colorTypePokemon[1],
                      ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: _TitleColors(
                    title: 'About',
                    color: pokemon.colorTypePokemon[0],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      _AboutColumn(
                        icon: Icons.balance,
                        atributoName: 'Weight',
                        value: pokemon.peso,
                        // isMoves: false,
                      ),
                      const _SeparadorVertical(height: 90),
                      _AboutColumn(
                        icon: Icons.straighten,
                        atributoName: 'Height',
                        value: pokemon.altura,
                        // isMoves: false,
                      ),
                      const _SeparadorVertical(height: 90),
                      _AboutColumn(
                        icon: Icons.balance,
                        atributoName: 'Moves',
                        value: 18,
                        // isMoves: true,
                        moves: pokemon.movimientos,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                _Description(
                  description: pokemon.descripcion,
                ),
                // const SizedBox(height: 10),
                _TitleColors(
                  title: 'Base Stats',
                  color: pokemon.colorTypePokemon[0],
                ),
                _BarrasStats(
                  size: size,
                  pokemon: pokemon,
                ),
                // const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BarrasStats extends StatelessWidget {
  const _BarrasStats({
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
                  _TextStat(
                    stat: 'HP',
                    color: pokemon.colorTypePokemon[0],
                  ),
                  _TextStat(
                    stat: 'ATK',
                    color: pokemon.colorTypePokemon[0],
                  ),
                  _TextStat(
                    stat: 'DEF',
                    color: pokemon.colorTypePokemon[0],
                  ),
                  _TextStat(
                    stat: 'SATK',
                    color: pokemon.colorTypePokemon[0],
                  ),
                  _TextStat(
                    stat: 'SDEF',
                    color: pokemon.colorTypePokemon[0],
                  ),
                  _TextStat(
                    stat: 'SPD',
                    color: pokemon.colorTypePokemon[0],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: _SeparadorVertical(height: 120),
            ),
            SizedBox(
              width: size.width * 0.68,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _TextStatNumber(
                          stat: pokemon.vida.toString(), isNumberStat: true),
                      _BarraStat(
                        statBarra: pokemon.vida.toDouble() * 1.65,
                        colorBarra: pokemon.colorTypePokemon[0],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      _TextStatNumber(
                          stat: pokemon.ataque.toString(), isNumberStat: true),
                      _BarraStat(
                        statBarra: pokemon.ataque.toDouble() * 1.65,
                        colorBarra: pokemon.colorTypePokemon[0],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      _TextStatNumber(
                          stat: pokemon.defensa.toString(), isNumberStat: true),
                      _BarraStat(
                        statBarra: pokemon.defensa.toDouble() * 1.65,
                        colorBarra: pokemon.colorTypePokemon[0],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      _TextStatNumber(
                          stat: pokemon.especialAtaque.toString(),
                          isNumberStat: true),
                      _BarraStat(
                        statBarra: pokemon.especialAtaque.toDouble() * 1.65,
                        colorBarra: pokemon.colorTypePokemon[0],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      _TextStatNumber(
                          stat: pokemon.especialDefensa.toString(),
                          isNumberStat: true),
                      _BarraStat(
                        statBarra: pokemon.especialDefensa.toDouble() * 1.65,
                        colorBarra: pokemon.colorTypePokemon[0],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      _TextStatNumber(
                          stat: pokemon.velocidad.toString(),
                          isNumberStat: true),
                      _BarraStat(
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

class _BarraStat extends StatelessWidget {
  final double statBarra;
  final Color colorBarra;
  const _BarraStat({
    required this.statBarra,
    required this.colorBarra,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Stack(
          children: [
            // ! Se tiene que ver como expandir esta barra para que se vea completo
            const SizedBox(
              width: double.infinity,
              height: 5,
              child: Material(
                color: Color.fromARGB(255, 214, 214, 214),
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
            ),
            SizedBox(
              width: statBarra,
              height: 5,
              child: Material(
                  color: colorBarra,
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(100),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class _TextStatNumber extends StatelessWidget {
  final String stat;
  final bool isNumberStat;
  const _TextStatNumber({
    required this.stat,
    // ignore: unused_element
    this.isNumberStat = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 21,
      width: 26,
      child: Center(
        child: Text(
          stat,
          //! Cambiar el color por el del pokemon o settear el [AppTheme]
          style: TextStyle(
            color: (isNumberStat) ? colorTarjetaNombre : Colors.orange,
          ),
        ),
      ),
    );
  }
}

class _TextStat extends StatelessWidget {
  final String stat;
  final bool isNumberStat;
  final Color color;
  const _TextStat({
    required this.stat,
    // ignore: unused_element
    this.isNumberStat = false,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text(
        stat,
        //! Cambiar el color por el del pokemon o settear el [AppTheme]
        style: TextStyle(
          color: (isNumberStat) ? colorTarjetaNombre : color,
        ),
      ),
    );
  }
}

class _TitleColors extends StatelessWidget {
  final String title;
  final Color color;
  const _TitleColors({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: 24,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class _Description extends StatelessWidget {
  final String description;
  const _Description({required this.description});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.08,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Text(
            description,
            maxLines: 4,
            style: const TextStyle(
              color: colorTarjetaNombre,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

class _SeparadorVertical extends StatelessWidget {
  final double height;
  const _SeparadorVertical({required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1,
      height: height,
      child: const Material(
        color: Color.fromARGB(255, 214, 214, 214),
      ),
    );
  }
}

class _AboutColumn extends StatelessWidget {
  final IconData icon;
  final String atributoName;
  final int value;
  // final bool isMoves;
  final List<String>? moves;

  const _AboutColumn({
    required this.icon,
    required this.atributoName,
    required this.value,
    // required this.isMoves,
    // ignore: unused_element
    this.moves,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 90,
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              (moves != null)
                  ? Column(
                      children: [
                        Text(
                          moves![0],
                          style: const TextStyle(
                            color: colorMedium,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          moves![1],
                          style: const TextStyle(
                            color: colorMedium,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          icon,
                          color: colorMedium,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          value.toString(),
                          style: const TextStyle(
                            color: colorMedium,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
              const SizedBox(height: 20),
              Text(
                atributoName,
                style: const TextStyle(
                  color: colorMedium,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PokemonType extends StatelessWidget {
  final String type;
  final Color color;
  const _PokemonType({
    required this.type,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(100),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            child: Text(
              type,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BotonBack extends StatelessWidget {
  const _BotonBack();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: SizedBox(
          width: 50,
          height: 50,
          child: InkWell(
            onTap: () => context.pop(),
            child: const Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Fondo extends StatelessWidget {
  final Color colorFondoBoton;
  const _Fondo({
    required this.size,
    required this.colorFondoBoton,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // const Spacer(flex: 4),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Pokebola(
            colorBoton: colorSecundario.withOpacity(0.15),
            // ! Cambiar el color de fondo por el del pokemon o settear el [AppTheme]
            colorFondoBoton: colorFondoBoton,
            alturaCaras: 130,
            anchuraCaras: 265,
            margenEntreCaras: 20,
            radioExterior: 50,
          ),
        ),
        // const Spacer(flex: 4),
        const SizedBox(height: 15),
        Padding(
          padding: paddingCuadroGridandDetails,
          child: ClipRRect(
            borderRadius: borderRadiusGridView,
            child: SizedBox(
              width: size.width,
              height: size.height * 0.6,
              child: Material(
                color: colorSecundario,
                borderRadius: borderRadiusGridView,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: borderRadiusGridView,
                    boxShadow: sombraPrincipal,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
