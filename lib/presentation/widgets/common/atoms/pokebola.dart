import 'package:flutter/material.dart';

class Pokebola extends StatelessWidget {
  final Color colorBoton;
  final Color colorFondoBoton;
  final double anchuraCaras;
  final double alturaCaras;
  final double margenEntreCaras;
  final double radioExterior;

  const Pokebola({
    super.key,
    required this.colorBoton,
    required this.colorFondoBoton,
    required this.anchuraCaras,
    required this.alturaCaras,
    required this.margenEntreCaras,
    required this.radioExterior,
  });

  @override
  Widget build(BuildContext context) {
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
              decoration: BoxDecoration(
                color: colorBoton,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(500),
                  topRight: Radius.circular(500),
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
              decoration: BoxDecoration(
                color: colorBoton,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(500),
                  bottomRight: Radius.circular(500),
                ),
              ),
            ),
          ),

          //* Boton de la Pokebola
          CircleAvatar(
            backgroundColor: colorFondoBoton,
            radius: radioExterior,
            child: CircleAvatar(
              backgroundColor: colorBoton,
              radius: radioExterior / 2,
            ),
          ),
        ],
      ),
    );
  }
}
