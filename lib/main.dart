import 'package:examen_poke_api/config/go_router/router.dart';
import 'package:examen_poke_api/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      routerConfig: appRouter,
      theme: AppTheme().getTheme(),
    );
  }
}
