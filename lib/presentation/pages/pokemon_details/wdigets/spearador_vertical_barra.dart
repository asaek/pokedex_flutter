import 'package:flutter/material.dart';

class SeparadorVertical extends StatelessWidget {
  final double height;
  const SeparadorVertical({
    super.key,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1,
      height: height,
      child: const Material(
        color: Color.fromARGB(255, 214, 214, 214),
      ),
    );
  }
}
