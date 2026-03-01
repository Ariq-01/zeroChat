# Copilot Instructions

## Commands

```bash
flutter pub get          # Install dependencies
flutter run              # Run the app
flutter analyze          # Lint (uses flutter_lints)
flutter test             # Run all tests
flutter test test/widget_test.dart  # Run a single test file
```

## Architecture

This app follows **Clean Architecture** with three layers:

```
lib/
  core/di/         → GetIt service locator (injection.dart)
  domain/          → Pure Dart: entities, abstract repositories, use cases
  data/            → Implementations: Firebase/external service adapters
  presentation/    → Flutter UI: views/ and view_models/
```

**Dependency flow:** `presentation → domain ← data`  
The domain layer has zero Flutter/Firebase imports. Data and presentation depend on domain abstractions only.

**DI wiring:** All registrations live in `core/di/injection.dart`. `main.dart` calls `di.init()` before `runApp`. New features must register their dependencies there.

**Firebase config:** `firebase_options_dev.dart` is the dev environment config (imported directly in `injection.dart`). A separate prod config would follow the same pattern.

## Key Conventions

- **Use cases** wrap a single business operation and validate business rules before delegating to a repository (see `SendMessageUsecase`).
- **Entities** are plain Dart classes with validation logic as getters (e.g., `MessageEntity.isValid`).
- **Repository abstractions** live in `domain/repositories/`; their Firebase/external implementations live in `data/repositories/` with an `_impl` suffix.
- **GetIt** (`sl`) is the service locator — registered as `registerLazySingleton`. Access via `sl<Type>()`.
- Comments in this codebase are written in **Bahasa Indonesia**.
- `firebase_core` and `get_it` are required dependencies (used in `injection.dart`) — ensure they are present in `pubspec.yaml`.
