// Tema visual personalizado para la app
import 'package:flutter/material.dart';

class AppTheme {// Define el tema claro de la aplicación
  static final ThemeData lightTheme = ThemeData(// Tema claro
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.orange,
      brightness: Brightness.light,
    ),
    textTheme: const TextTheme(// Define los estilos de texto
      titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    ),
    appBarTheme: const AppBarTheme(// Define el tema de la AppBar
      backgroundColor: Colors.orange,
      foregroundColor: Colors.white,
    ),
  );
}
