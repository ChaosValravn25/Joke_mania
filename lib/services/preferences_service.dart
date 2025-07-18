import 'package:shared_preferences/shared_preferences.dart';
// Para guardar y recuperar categoría favorita con shared_preferences
class PreferencesService {
  static const _keyCategory = 'favorite_category';// Clave para la categoría favorita
  static const _keyLanguage = 'selected_language';// Clave para el idioma seleccionado

  Future<void> setCategory(String category) async {// Guarda la categoría favorita
    final prefs = await SharedPreferences.getInstance();// Obtiene la instancia de SharedPreferences
    await prefs.setString(_keyCategory, category);// Guarda la categoría usando la clave definida
  }

  Future<String?> getCategory() async {// Recupera la categoría favorita guardada
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyCategory);
  }

  Future<void> setLanguage(String langCode) async {// Guarda el idioma seleccionado
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyLanguage, langCode);
  }

  Future<String?> getLanguage() async {// Recupera el idioma seleccionado
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyLanguage);
  }
}


