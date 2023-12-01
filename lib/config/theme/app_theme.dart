import 'package:examen_poke_api/presentation/widgets/common/tokens/colores.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        // primaryColor: const Color(0xffDC0A2D),
        scaffoldBackgroundColor: colorPrincipal,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff1E1E1E),
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xffDC0A2D)),
      );
}
