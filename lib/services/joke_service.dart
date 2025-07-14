import 'dart:convert';
import 'package:http/http.dart' as http;
import 'preferences_service.dart';

class JokeService {
  final PreferencesService _prefs = PreferencesService();

  Future<String> fetchJoke() async {
    final category = await _prefs.getCategory() ?? 'Any';
    final url = Uri.parse("https://v2.jokeapi.dev/joke/$category?type=single");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json['joke'] ?? "No se encontró un chiste.";
    } else {
      throw Exception('Error al cargar el chiste');
    }
  }
}