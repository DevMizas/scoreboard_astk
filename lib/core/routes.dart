import 'package:flutter/material.dart';
import 'package:placar_astk/presentation/presentation.dart';

class AppRoutes {
  static const String home = '/';
  static const String about = '/about';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeView());
      // case about:
      //   return MaterialPageRoute(builder: (_) => const AboutView());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Página não encontrada')),
          ),
        );
    }
  }
}