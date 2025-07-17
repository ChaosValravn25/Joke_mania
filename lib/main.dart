import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'screens/home_page.dart'; // ¡Esto es clave! para llamar a home_page
import 'theme/app_theme.dart';// llamar theme
import 'screens/about.dart';// llamar about
import 'screens/settings_page.dart';// llamar settings_page
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
      title: 'Joke Mania',
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