import 'package:examen_poke_api/presentation/providers/providers.dart';
import 'package:examen_poke_api/presentation/tokens/border_radius.dart';
import 'package:examen_poke_api/presentation/tokens/colores.dart';
import 'package:examen_poke_api/presentation/tokens/sombras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Buscador extends ConsumerWidget {
  const Buscador({
    super.key,
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
