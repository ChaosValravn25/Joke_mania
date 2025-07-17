## Joke_mania - App de Chistes por Categoría
- Joke mania es una prueba de concepto desarrollada en Flutter como parte de la Evaluación Acumulativa Opcional del curso Programación de Dispositivos Móviles 2025/1. Permite obtener chistes aleatorios por categoría, seleccionarla como favorita, compartir el chiste y navegar entre pantallas informativas.

## Desarrolladora

- Ivonne Santander Soto
- Curso: Programación de Dispositivos Móviles 2025/1


## Características principales

- Chistes por categoría (programación, oscuros, etc.)
- API: https://v2.jokeapi.dev
- Guardado de categoría favorita con `shared_preferences`
- Compartir chistes con otras apps usando `share_plus`
- Navegación estructurada
- Tema visual coherente con Material 3

## Estructura de archivos


joker_mania/
├── assets/
│   ├── fonts
│   │   ├── Lato-Regulat.ttf
│   ├── icons
│   │   ├── joke.png
├── lib/
│   ├── main.dart
│   ├── screens/
│   │   ├── home_page.dart
│   │   ├── settings_page.dart
│   │   ├── about_page.dart
│   ├── services/
│   │   ├── joke_service.dart
│   │   └── preferences_service.dart
│   ├── models/
│   │   └── joke.dart
│   ├── widgets/
│   │   └── joke_card.dart
│   └── theme/
│       └── app_theme.dart
├── pubspec.yaml
├── README.md
---

### 6. **Dependencias usadas**
```markdown
## 🔧 Dependencias

- `http`: para consumir la API
- `shared_preferences`: para guardar preferencias del usuario
- `share_plus`: para compartir chistes con otras apps
- `provider`: gestión de estado

