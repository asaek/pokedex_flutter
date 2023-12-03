import 'package:flutter/material.dart';

class LoadingPokedex extends StatelessWidget {
  const LoadingPokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 200,
          width: 250,
          child: Image.asset(
            'assets/images/pikachu_pokebola_corriendo.gif',
            fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(
          width: double.infinity,
        ),
      ],
    );
  }
}
