import 'package:flutter/material.dart';
//Acerca de la aplicacion
class About extends StatelessWidget {// Pantalla de información sobre la aplicación
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Acerca de')),// Título de la pantalla

      body: Padding(// Añade un padding alrededor del contenido
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [// Contenido de la pantalla "Acerca de"
            Text('Joke Mania', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),// Título de la aplicación
            SizedBox(height: 10),// Espacio entre elementos
            Text('Versión de la aplicacion: Versión 1.0.0'),// Versión de la aplicación
            SizedBox(height: 10),
            Text('Desarrollado por Ivonne Santander Soto'),// Desarrollador de la aplicación
            SizedBox(height: 20),
            Text('Recursos:'),// Recursos utilizados en la aplicación
            Text('- API de chistes: https://v2.jokeapi.dev/'),// URL de la API de chistes
            Text('- Flutter + Material 3'),// Framework utilizado
            Text('- share_plus, http, shared_preferences'),// Paquetes utilizados
            SizedBox(height: 20),
            Text('Objetivo de la App: Disfrutar de un gran repertorios de chiste de diferente indoles y compartirlo con tus amigos en diferentes aplicaciones.'),// Objetivo de la aplicación
            SizedBox(height: 20),
            Text('Licencia: MIT: Revisión del código y uso permitido con atribución.'),// Licencia de la aplicación
          ],
        ),
      ),
    );
  }
}
