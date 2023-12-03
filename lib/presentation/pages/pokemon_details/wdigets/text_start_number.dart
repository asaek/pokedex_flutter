import 'package:examen_poke_api/presentation/tokens/colores.dart';
import 'package:flutter/material.dart';

class TextStatNumber extends StatelessWidget {
  final int stat;

  const TextStatNumber({
    super.key,
    required this.stat,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 21,
      width: 26,
      child: Center(
        child: TweenAnimationBuilder(
          tween: IntTween(begin: 0, end: stat),
          duration: const Duration(milliseconds: 2000),
          builder: (BuildContext context, int value, Widget? child) {
            return Text(
              value.toString(),
              style: const TextStyle(
                color: colorTarjetaNombre,
              ),
            );
          },
        ),
      ),
    );
  }
}
