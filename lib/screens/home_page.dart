import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../services/joke_service.dart';
import '../widgets/joke_card.dart';
import 'settings_page.dart';
import 'about.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  
}

class _HomePageState extends State<HomePage> {
  final JokeService _jokeService = JokeService();// Servicio para obtener chistes
  String _joke = "Presiona el botón para ver un chiste";
  bool _isLoading = false;// Estado de carga para mostrar un indicador de progreso
  // Inicializa el estado y carga un chiste al inicio

   @override
    void initState() {
    super.initState();
    _loadJoke(); // Cargar automáticamente al iniciar
    }

 Future<void> _loadJoke() async {// Función para cargar un chiste
  setState(() => _isLoading = true);// Muestra el indicador de carga
  try {
    final joke = await _jokeService.fetchJoke();
    if (joke.startsWith("Warning")) {// Si el chiste no se encuentra, muestra un mensaje
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No se encontró un chiste en ese idioma. Cambia de idioma en Configuración.")),
      );
    }
    setState(() => _joke = joke);// Actualiza el estado con el chiste obtenido
  } catch (e) {// Si ocurre un error al obtener el chiste, muestra un mensaje de error
    setState(() => _joke = "Error al obtener chiste");
  } finally {// Independientemente del resultado, oculta el indicador de carga
    setState(() => _isLoading = false);
  }
}

  void _shareJoke() {// Función para compartir el chiste
    Share.share(_joke);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
        mainAxisSize: MainAxisSize.min,
          children: [// Icono y título de la app
              Image.asset('assets/icons/joke.png', height: 80),
              const SizedBox(width: 8),
              const Text('Joke Mania'),
            ],
          ),
        actions: [
          IconButton(// Botón de configuración
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingsPage()),// Navega a la página de configuración
            ),
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const About()),// Navega a la página "Acerca de"
            ),
          ),
        ],
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      '¡Tu chiste del día!',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    JokeCard(
                      joke: _joke,
                      onRefresh: _loadJoke,
                      onShare: _joke.startsWith("Pulsa") || _joke.startsWith("Error") ? () {} : _shareJoke,
                    ),
                  ],
                ),
              ),
        ),
    );
  }
}
