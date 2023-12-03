import 'package:flutter/material.dart';

class BusquedaVacia extends StatelessWidget {
  const BusquedaVacia({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(
          flex: 3,
        ),
        SizedBox(
          height: 200,
          width: 200,
          child: Image.asset(
            'assets/images/pikachu_corriendo.gif',
            fit: BoxFit.fitWidth,
          ),
        ),
        const Text('No se encontraron pokemons',
            style: TextStyle(fontSize: 25)),
        const Spacer(
          flex: 6,
        ),
        const SizedBox(
          width: double.infinity,
        ),
      ],
    );
  }
}
