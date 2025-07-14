import 'package:shared_preferences/shared_preferences.dart';
// Para guardar y recuperar categoría favorita con shared_preferences
class PreferencesService {
  static const _keyCategory = 'favorite_category';

  Future<void> setCategory(String category) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyCategory, category);
  }

  Future<String?> getCategory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyCategory);
  }
}

