import 'package:examen_poke_api/domain/entities/entitites.dart';
import 'package:examen_poke_api/presentation/providers/providers.dart';
import 'package:examen_poke_api/presentation/widgets/common/atoms/border_radius.dart';
import 'package:examen_poke_api/presentation/widgets/common/tokens/colores.dart';
import 'package:examen_poke_api/presentation/widgets/common/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokedexPage extends StatelessWidget {
  static const routerName = 'pokedex_menu';

  const PokedexPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
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
                    Pokebola(),
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 7,
                  right: 7,
                  top: 20,
                  bottom: 7,
                ),
                child: ClipRRect(
                  borderRadius: borderRadiusGridView,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: colorSecundario,
                      borderRadius: borderRadiusGridView,
                    ),
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x33000000),
                            blurRadius: 100,
                            offset: Offset(0, 1),
                            spreadRadius: 1,
                          )
                        ],
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 4,
                        ),
                        decoration: const BoxDecoration(
                          color: colorSecundario,
                          borderRadius: borderRadiusGridView,
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
            child: SizedBox(
              height: 43,
              child: Material(
                color: colorSecundario,
                borderRadius: BorderRadius.circular(60),
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
            child: SizedBox(
              width: 43,
              height: 43,
              child: Material(
                color: colorSecundario,
                borderRadius: BorderRadius.circular(60),
                child: const Icon(Icons.menu, color: colorPrincipal),
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
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemCount: pokemons.length,
      itemBuilder: (context, index) {
        // final Size size = MediaQuery.of(context).size;
        return Container(
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
                          color: colorTarjetaId,
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
        );
      },
    );
  }
}
