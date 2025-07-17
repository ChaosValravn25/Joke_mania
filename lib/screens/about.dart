import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Acerca de')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Joke Mania', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Versión 1.0.0'),
            SizedBox(height: 10),
            Text('Desarrollado por Ivonne Santander Soto'),
            SizedBox(height: 20),
            Text('Recursos:'),
            Text('- https://v2.jokeapi.dev/'),
            Text('- Flutter + Material 3'),
            Text('- share_plus, http, shared_preferences'),
          ],
        ),
      ),
    );
  }
}
