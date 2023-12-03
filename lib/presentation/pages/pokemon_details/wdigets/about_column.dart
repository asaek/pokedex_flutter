import 'package:examen_poke_api/presentation/tokens/colores.dart';
import 'package:flutter/material.dart';

class AboutColumn extends StatelessWidget {
  final IconData icon;
  final String atributoName;
  final int value;
  // final bool isMoves;
  final List<String>? moves;

  const AboutColumn({
    super.key,
    required this.icon,
    required this.atributoName,
    required this.value,
    // required this.isMoves,
    // ignore: unused_element
    this.moves,
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
              (moves != null)
                  ? Column(
                      children: [
                        Text(
                          moves![0],
                          style: const TextStyle(
                            color: colorMedium,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          moves![1],
                          style: const TextStyle(
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
