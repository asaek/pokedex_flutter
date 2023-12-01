import 'package:examen_poke_api/presentation/widgets/common/tokens/colores.dart';
import 'package:flutter/material.dart';

class Pokebola extends StatelessWidget {
  const Pokebola({super.key});

  @override
  Widget build(BuildContext context) {
    const double alturaCaras = 16;
    const double anchuraCaras = 36;
    const double margenEntreCaras = 5;
    return Container(
      width: anchuraCaras,
      height: (alturaCaras * 2) + margenEntreCaras,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          //* Parte superior roja
          Positioned(
            top: 0,
            child: Container(
              width: anchuraCaras,
              height: alturaCaras,
              // margin: const EdgeInsets.only(bottom: 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
              ),
            ),
          ),
          //* Parte inferior blanca
          Positioned(
            bottom: 0,
            child: Container(
              width: anchuraCaras,
              height: alturaCaras,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
            ),
          ),

          //* Boton de la Pokebola
          const CircleAvatar(
            backgroundColor: colorPrincipal,
            radius: 9,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 5,
            ),
          ),
        ],
      ),
    );
  }
}
