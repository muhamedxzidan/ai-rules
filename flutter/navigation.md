# Navigation

## MUST
- Built-in named routes with `Navigator.pushNamed` / `pushReplacementNamed`.
- All route names are constants in `AppRoutes` (`core/constants/app_routes.dart`). No route string literals elsewhere.
- Navigation is triggered from widgets (e.g. a `BlocListener`), never from inside a Cubit.

```dart
class AppRoutes {
  static const String home = '/home';
  static const String login = '/login';
}
Navigator.pushNamed(context, AppRoutes.home);
```
