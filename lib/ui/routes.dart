import 'package:examen2p_appsmov_g4/ui/views/home/homeview.dart';
import 'package:examen2p_appsmov_g4/ui/views/splash.dart';
import 'package:flutter/material.dart';
class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeView());
      case '/':
        return MaterialPageRoute(builder: (_) => SplashView());
      default:
//Aquí se irán agregando las rutas por cada clase dart creada.
    return _errorRoute();
  }
  }
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
          centerTitle: true,
        ),
        body: const Center(
          child: Text("ERROR"),
        ),
      );
    });
  }
}