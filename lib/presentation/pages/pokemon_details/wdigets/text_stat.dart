import 'package:flutter/material.dart';

class TextStat extends StatelessWidget {
  final String stat;
  final Color color;
  const TextStat({
    super.key,
    required this.stat,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text(
        stat,
        style: TextStyle(
          color: color,
        ),
      ),
    );
  }
}
