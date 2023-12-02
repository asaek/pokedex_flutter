import 'package:examen_poke_api/presentation/tokens/border_radius.dart';
import 'package:examen_poke_api/presentation/tokens/colores.dart';
import 'package:examen_poke_api/presentation/tokens/paddings.dart';
import 'package:examen_poke_api/presentation/tokens/sombras.dart';
import 'package:examen_poke_api/presentation/widgets/common/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PokemondetailsPage extends StatelessWidget {
  static const routerName = 'pokemon_details';

  const PokemondetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      // ! Cambiar el color de fondo por el del pokemon o settear el [AppTheme]
      backgroundColor: Colors.orange,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            _Fondo(size: size),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 20),
                  child: SizedBox(
                    // height: 100,
                    child: Row(
                      children: [
                        _BotonBack(),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Pikachu',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 33,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          '#025',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //! Imagen del pokemon
                SizedBox(
                  width: size.width * 0.6,
                  height: size.height * 0.3,
                  child: const Placeholder(),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _PokemonType(),
                    _PokemonType(),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  child: _TitleColors(
                    title: 'About',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      _AboutColumn(
                        icon: Icons.balance,
                        atributoName: 'Weight',
                        value: 18,
                        isMoves: false,
                      ),
                      _SeparadorVertical(height: 90),
                      _AboutColumn(
                        icon: Icons.straighten,
                        atributoName: 'Height',
                        value: 6,
                        isMoves: false,
                      ),
                      _SeparadorVertical(height: 90),
                      _AboutColumn(
                        icon: Icons.balance,
                        atributoName: 'Moves',
                        value: 18,
                        isMoves: true,
                      ),
                    ],
                  ),
                ),
                const _Description(
                  description:
                      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley ",
                ),
                const _TitleColors(
                  title: 'Base Stats',
                ),
                const Padding(
                  padding: paddingStatsAndDescription,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          _TextStat(stat: 'HP'),
                          _TextStat(stat: 'ATK'),
                          _TextStat(stat: 'DEF'),
                          _TextStat(stat: 'SATK'),
                          _TextStat(stat: 'SDEF'),
                          _TextStat(stat: 'SPD'),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: _SeparadorVertical(height: 120),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _TextStat(stat: '45', isNumberStat: true),
                          _TextStat(stat: '49', isNumberStat: true),
                          _TextStat(stat: '49', isNumberStat: true),
                          _TextStat(stat: '65', isNumberStat: true),
                          _TextStat(stat: '65', isNumberStat: true),
                          _TextStat(stat: '45', isNumberStat: true),
                        ],
                      ),
                      Column(
                        children: [
                          _BarraStat(),
                          _BarraStat(),
                          _BarraStat(),
                          _BarraStat(),
                          _BarraStat(),
                          _BarraStat(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BarraStat extends StatelessWidget {
  const _BarraStat();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.2),
      child: Stack(
        children: [
          // ! Se tiene que ver como expandir esta barra para que se vea completo
          SizedBox(
            width: 100,
            height: 5,
            child: Material(
              color: Color.fromARGB(255, 214, 214, 214),
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
          ),
          SizedBox(
            width: 45,
            height: 5,
            child: Material(
              color: Colors.orange,
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
          ),
        ],
      ),
    );
  }
}

class _TextStat extends StatelessWidget {
  final String stat;
  final bool isNumberStat;
  const _TextStat({
    required this.stat,
    // ignore: unused_element
    this.isNumberStat = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text(
        stat,
        //! Cambiar el color por el del pokemon o settear el [AppTheme]
        style: TextStyle(
          color: (isNumberStat) ? colorTarjetaNombre : Colors.orange,
        ),
      ),
    );
  }
}

class _TitleColors extends StatelessWidget {
  final String title;
  const _TitleColors({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.orange,
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
    return Expanded(
      child: Padding(
        padding: paddingStatsAndDescription,
        child: Text(
          description,
          style: const TextStyle(
            color: colorTarjetaNombre,
            fontSize: 15,
            fontWeight: FontWeight.w400,
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
  final bool isMoves;

  const _AboutColumn({
    required this.icon,
    required this.atributoName,
    required this.value,
    required this.isMoves,
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
              (isMoves)
                  ? const Column(
                      children: [
                        Text(
                          'Chlroophyll',
                          style: TextStyle(
                            color: colorMedium,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Overgrow',
                          style: TextStyle(
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
  const _PokemonType();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        child: Material(
          color: Colors.green,
          borderRadius: BorderRadius.circular(100),
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            child: Text(
              'Grass',
              style: TextStyle(
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
  const _Fondo({
    required this.size,
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
            colorFondoBoton: Colors.orange,
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
