import 'package:flutter/material.dart';

class BarraStat extends StatelessWidget {
  final double statBarra;
  final Color colorBarra;
  const BarraStat({
    super.key,
    required this.statBarra,
    required this.colorBarra,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Stack(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 5,
              child: Material(
                color: Color.fromARGB(255, 214, 214, 214),
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
            ),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: statBarra),
              duration: const Duration(seconds: 2),
              builder: (BuildContext context, double value, Widget? child) {
                return SizedBox(
                  width: value,
                  height: 5,
                  child: Material(
                    color: colorBarra,
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(100),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
