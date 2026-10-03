# UI Rules (Screens & Widgets)

## Screens = thin compositors
- Only compose child widgets with layout and spacing.
- NO `BlocBuilder`, `BlocConsumer`, direct `ListView`, or inline UI logic in a Screen.
- In the `<plan>`, break the UI into sub-widgets BEFORE coding.

```dart
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Column(children: [LoginHeader(), LoginForm(), LoginFooter()]),
      );
}
```

## Widgets
- Each distinct section = its own file in the feature's `presentation/widgets/`.
- Widget > 100 lines -> split. Reusable/independent piece -> split immediately.
- `BlocBuilder` / `BlocConsumer` live in widgets, not screens.
- Widgets render, listen to Cubit state, and call Cubit methods. Nothing else.

## UI / logic separation
| Layer | Does | Must NOT contain |
|---|---|---|
| Widget | Render state, call Cubit | Business logic, calculations, filtering, validation |
| Cubit | Logic, transitions | UI, BuildContext, navigation calls |
| Repository | Data access, transforms | UI or state logic |

Allowed in a widget: choosing WHICH widget to show based on the state type (`switch`/`is`). Not allowed: computing or filtering data.

```dart
// BAD: logic in the widget
final filtered = state.orders.where((o) => o.status == 'active').toList();
// OK: the Cubit emits already-filtered data (e.g. OrderSuccess.activeOrders)
```
