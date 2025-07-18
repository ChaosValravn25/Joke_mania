import 'package:flutter/material.dart';
import '../services/preferences_service.dart';

// Pantalla para elegir una categoría favorita de chistes y el idioma
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final PreferencesService _preferencesService = PreferencesService();
  String? _selectedCategory;
  String? _selectedLanguage;

  final List<String> _categories = [
    'Any', 'Programming', 'Miscellaneous', 'Dark', 'Pun', 'Spooky', 'Christmas'
  ];

  final List<Map<String, String>> _languages = [
    {'code': 'en', 'label': 'Inglés'},
    {'code': 'de', 'label': 'Alemán'},
    {'code': 'es', 'label': 'Español'},
    {'code': 'cs', 'label': 'Checo'},
    {'code': 'pt', 'label': 'Portugués'},
    {'code': 'fr', 'label': 'Francés'},
  ];

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  void _loadPreferences() async {
    final savedCategory = await _preferencesService.getCategory();
    final savedLanguage = await _preferencesService.getLanguage();
    setState(() {
      _selectedCategory = savedCategory ?? 'Any';
      _selectedLanguage = savedLanguage ?? 'es';
    });
  }

  void _saveLanguage(String? langCode) async {
    if (langCode != null) {
      await _preferencesService.setLanguage(langCode);
      setState(() => _selectedLanguage = langCode);
    }
  }

  void _saveCategory(String? value) async {
    if (value != null) {
      await _preferencesService.setCategory(value);
      setState(() => _selectedCategory = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preferencias')),
      body: ListView(
        children: [
          const ListTile(title: Text('Categoría favorita')),
          for (var category in _categories)
            RadioListTile<String>(
              title: Text(category),
              value: category,
              groupValue: _selectedCategory,
              onChanged: _saveCategory,
            ),
          const Divider(),
          const ListTile(title: Text('Idioma')),
          for (var lang in _languages)
            RadioListTile<String>(
              title: Text(lang['label']!),
              value: lang['code']!,
              groupValue: _selectedLanguage,
              onChanged: _saveLanguage,
            ),
        ],
      ),
    );
  }
}