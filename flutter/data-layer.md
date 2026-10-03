# Data Layer (Models + Repositories)

## Models
- Manual `fromJson` / `toJson` only. No `freezed`, no `json_serializable`.
- Never `dynamic`. Map keys safely; missing key -> sensible default or null handled.
- Never pass raw `Map<String, dynamic>` between layers; convert to typed models in the repository.

```dart
class UserModel {
  final String id;
  final String name;
  final String email;
  const UserModel({required this.id, required this.name, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as String? ?? '',
        name: json['name'] as String? ?? '',
        email: json['email'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'email': email};
}
```

## Repositories
- Each feature has `*_repository_base.dart` (abstract) + implementation. Cubits depend on the base.
- Repository owns: data access, calling API/Firebase, response handling, mapping to models, data transformations.
- Returns strongly typed results (model, list, or a Result/Failure type) and fully isolates the Cubit from networking.
- Keep clients private (`final _firestore = FirebaseFirestore.instance;`).
- Public methods have `///` doc comments.
- No UI or state logic here.
