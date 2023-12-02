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

class PokedexPage extends StatelessWidget {
  static const routerName = 'pokedex_menu';

  const PokedexPage({super.key});

  @override
  Widget build(BuildContext context) {
    const double padding = 20;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.only(left: padding),
                child: Row(
                  children: [
                    Pokebola(
                      colorBoton: colorSecundario,
                      colorFondoBoton: colorPrincipal,
                      alturaCaras: 17,
                      anchuraCaras: 39,
                      margenEntreCaras: 5,
                      radioExterior: 9,
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Pokédex',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const _Buscador(padding: padding),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: paddingCuadroGridandDetails,
                child: ClipRRect(
                  borderRadius: borderRadiusGridView,
                  child: Material(
                    color: colorSecundario,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),
                        boxShadow: sombraPrincipal,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 11),
                        child: _ListPokemons(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Buscador extends ConsumerWidget {
  const _Buscador({
    required this.padding,
  });

  final double padding;

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: borderRadiusSearch,
              child: SizedBox(
                height: 43,
                child: Material(
                  color: colorSecundario,
                  borderRadius: borderRadiusSearch,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: borderRadiusSearch,
                      boxShadow: sombraPrincipal,
                    ),
                    child: TextField(
                      onChanged: (value) {
                        ref
                            .read(pokemonsListProvider.notifier)
                            .buscarPokemons(nombrePokemon: value);
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                        contentPadding: EdgeInsets.fromLTRB(
                          0,
                          10.5,
                          0,
                          0,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: colorPrincipal,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: padding),
          PopupMenuButton<String>(
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 'id',
                  child: Text('Ordenar por ID'),
                ),
                const PopupMenuItem(
                  value: 'alfabetico',
                  child: Text('Ordenar alfabeticamente'),
                ),
              ];
            },
            onSelected: (String value) {
              if (value == 'alfabetico') {
                ref
                    .read(pokemonsListProvider.notifier)
                    .sortPokemonsAlfabeticamente();
              } else if (value == 'id') {
                ref.read(pokemonsListProvider.notifier).sortPokemonsId();
              }
            },
            child: ClipRRect(
              borderRadius: borderRadiusBotonMenu,
              child: SizedBox(
                width: 43,
                height: 43,
                child: Material(
                  color: colorSecundario,
                  shape: const CircleBorder(),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      boxShadow: sombraPrincipal,
                    ),
                    child: const Icon(Icons.menu, color: colorPrincipal),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListPokemons extends ConsumerStatefulWidget {
  const _ListPokemons();

  @override
  _ListPokemonsState createState() => _ListPokemonsState();
}

class _ListPokemonsState extends ConsumerState<_ListPokemons> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    ref.read(pokemonsListProvider.notifier).loadNextPage();

    scrollController.addListener(() {
      // print(
      //     '${scrollController.position.pixels + 600}  ---  ${scrollController.position.maxScrollExtent}');

      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        ref.read(pokemonsListProvider.notifier).loadNextPage();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Pokemon> pokemons = ref.watch(pokemonsListProvider);
    if (pokemons.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return GridView.builder(
      padding: const EdgeInsets.only(top: 20),
      controller: scrollController,
      clipBehavior: Clip.none,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemCount: pokemons.length,
      itemBuilder: (context, index) {
        // final Size size = MediaQuery.of(context).size;
        return Material(
          child: InkWell(
            onTap: () {
              ref.read(selectedPokemonProvider.notifier).state =
                  pokemons[index];
              context.push(
                '/pokemon_details',
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: colorSecundario,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 3,
                    offset: Offset(0, 1),
                    spreadRadius: 1,
                  )
                ],
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: Material(
                      color: colorBackground,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 7, right: 10),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            pokemons[index].idPokemon.toString(),
                            style: const TextStyle(
                              color: colorMedium,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        child: Image.network(
                          pokemons[index].urlImagen,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        pokemons[index].nombre,
                        style: const TextStyle(
                          color: colorTarjetaNombre,
                          fontSize: 17,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
