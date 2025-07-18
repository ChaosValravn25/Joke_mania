// Widget para mostrar un chiste en un Card
import 'package:flutter/material.dart';

class JokeCard extends StatelessWidget {// Widget que representa un chiste
  final String joke;
  final VoidCallback onRefresh;
  final VoidCallback onShare;

  const JokeCard({// Constructor del widget
    super.key,
    required this.joke,
    required this.onRefresh,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),// Define el borde redondeado del Card
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(// Muestra el texto del chiste
              joke,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [// Botones para refrescar y compartir el chiste
                ElevatedButton.icon(
                  onPressed: onRefresh,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Nuevo'),
                ),
                ElevatedButton.icon(// Botón para compartir el chiste
                  onPressed: onShare,
                  icon: const Icon(Icons.share),
                  label: const Text('Compartir'),
                ),
                ElevatedButton(
                  key: Key('refreshJokeButton'),
                  onPressed: onRefresh,
                  child: Text('Nuevo chiste'),
                ),
                ],
            )
          ],
        ),
      ),
    );
  }
}