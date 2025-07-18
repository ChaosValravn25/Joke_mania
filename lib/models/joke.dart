class Joke {
  // Modelo para chiste (versión simple con solo 'joke')
  final String joke;// Texto del chiste

  Joke({required this.joke});// Constructor que recibe el texto del chiste

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(joke: json['joke'] ?? 'Sin chiste disponible');// Crea una instancia de Joke a partir de un JSON
  }
}
