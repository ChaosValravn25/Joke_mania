import 'dart:convert';
import 'package:http/http.dart' as http;

class JokeService {
  Future<String> fetchJoke() async {
    final url = Uri.parse("https://v2.jokeapi.dev/joke/Any?type=single");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json['joke'] ?? "No joke found!";
    } else {
      throw Exception('Error al cargar el chiste');
    }
  }
}
