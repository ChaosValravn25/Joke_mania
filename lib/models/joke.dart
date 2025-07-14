class Joke {
  // Modelo para chiste (versión simple con solo 'joke')
  final String joke;

  Joke({required this.joke});

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(joke: json['joke'] ?? 'Sin chiste disponible');
  }
}
