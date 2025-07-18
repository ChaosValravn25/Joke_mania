import 'dart:convert';
import 'package:http/http.dart' as http;
import 'preferences_service.dart';
//Joke Service para obtener chistes de la API en foma de JSON
class JokeService {
  final PreferencesService _prefs = PreferencesService();

  Future<String> fetchJoke() async {// Obtiene un chiste de la API
    final category = await _prefs.getCategory() ?? 'Any';// Obtiene la categoría favorita guardada o usa 'Any' por defecto
    final lang = await _prefs.getLanguage() ?? 'es';// Obtiene el idioma seleccionado o usa 'es' por defecto
    final url = Uri.parse('https://v2.jokeapi.dev/joke/$category?type=single&lang=$lang');// Construye la URL de la API con la categoría y el idioma

    final response = await http.get(url);// Realiza la solicitud HTTP a la API

    if (response.statusCode == 200) {// Si la respuesta es exitosa (código 200)
      final data = jsonDecode(response.body);// Decodifica la respuesta JSON
      if (data.containsKey('joke')) {// Verifica si el JSON contiene la clave 'joke'
        return data['joke'];
      } else {// Si no contiene 'joke', verifica si contiene 'setup' y 'delivery'
        return 'No se encontró un chiste en ese idioma.';
      }
    } else {// Si la respuesta no es exitosa, lanza una excepción
      throw Exception('Error al cargar el chiste');
    }
  }
}