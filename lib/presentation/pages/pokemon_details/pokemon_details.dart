import 'package:animate_do/animate_do.dart';
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

import 'wdigets/widgets_pokemon_details.dart';

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
                  child: Hero(
                    tag: pokemon.idPokemon,
                    child: Image.network(pokemon.urlImagen, fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FadeInDown(
                  duration: const Duration(milliseconds: 1500),
                  delay: const Duration(milliseconds: 500),
                  child: Row(
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
                  child: FadeInUp(
                    duration: const Duration(milliseconds: 1500),
                    child: Row(
                      children: [
                        AboutColumn(
                          icon: Icons.balance,
                          atributoName: 'Weight',
                          value: pokemon.peso,
                          // isMoves: false,
                        ),
                        const SeparadorVertical(height: 90),
                        AboutColumn(
                          icon: Icons.straighten,
                          atributoName: 'Height',
                          value: pokemon.altura,
                          // isMoves: false,
                        ),
                        const SeparadorVertical(height: 90),
                        AboutColumn(
                          icon: Icons.balance,
                          atributoName: 'Moves',
                          value: 18,
                          // isMoves: true,
                          moves: pokemon.movimientos,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                FadeIn(
                  duration: const Duration(milliseconds: 1500),
                  child: _Description(
                    description: pokemon.descripcion,
                  ),
                ),
                // const SizedBox(height: 10),
                _TitleColors(
                  title: 'Base Stats',
                  color: pokemon.colorTypePokemon[0],
                ),
                BarrasStats(
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
            textAlign: TextAlign.center,
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
          child: Hero(
            tag: 'pokebola',
            child: Pokebola(
              colorBoton: colorSecundario.withOpacity(0.15),
              colorFondoBoton: colorFondoBoton,
              alturaCaras: 130,
              anchuraCaras: 265,
              margenEntreCaras: 20,
              radioExterior: 50,
            ),
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
