import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'screens/home_page.dart'; // ¡Esto es clave! para llamar a home_page
import 'theme/app_theme.dart';
import 'screens/about.dart';
import 'screens/settings_page.dart';
void main() {
  var logger = Logger();
  logger.d("Logger iniciado correctamente");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JokeNinja',
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/settings': (context) => SettingsPage(),
        '/about': (context) => About(),
      },
    );
  }
}