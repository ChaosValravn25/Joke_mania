import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../services/joke_service.dart';
import 'about.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  
}

class _HomePageState extends State<HomePage> {
  final JokeService _jokeService = JokeService();
  String _joke = "Presiona el botón para ver un chiste";
  bool _isLoading = false;
  
  Future<void> _loadJoke() async {
    setState(() => _isLoading = true);
    try {
      final joke = await _jokeService.fetchJoke();
      setState(() {
        _joke = joke;
      });
    } catch (e) {
      setState(() {
        _joke = "Error al obtener chiste 😞";
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _shareJoke() {
    Share.share(_joke);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
        mainAxisSize: MainAxisSize.min,
          children: [
              Image.asset('assets/icons/joke.png', height: 80),
              const SizedBox(width: 8),
              const Text('Joke Mania'),
            ],
          ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingsPage()),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const About()),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    '¡Tu chiste del día!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  _isLoading
                      ? const CircularProgressIndicator()
                      : Text(
                          _joke,
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.refresh),
                    label: const Text('Nuevo chiste'),
                    onPressed: _loadJoke,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.share),
                    label: const Text('Compartir'),
                    onPressed: _joke.startsWith("Presiona") ? null : _shareJoke,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
