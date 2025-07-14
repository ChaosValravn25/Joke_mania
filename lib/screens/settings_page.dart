import 'package:flutter/material.dart';
import '../services/preferences_service.dart';
// Pantalla para elegir una categoría favorita de chistes
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final PreferencesService _preferencesService = PreferencesService();
  String? _selectedCategory;

  final List<String> _categories = [
    'Any', 'Programming', 'Miscellaneous', 'Dark', 'Pun', 'Spooky', 'Christmas'
  ];

  @override
  void initState() {
    super.initState();
    _loadCategory();
  }

  void _loadCategory() async {
    final saved = await _preferencesService.getCategory();
    setState(() {
      _selectedCategory = saved ?? 'Any';
    });
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
            RadioListTile(
              title: Text(category),
              value: category,
              groupValue: _selectedCategory,
              onChanged: _saveCategory,
            )
        ],
      ),
    );
  }
}
