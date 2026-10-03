# Firebase

## MUST
- Auth calls: `try/catch` with `FirebaseAuthException`, mapped to specific messages.
- Handle Firestore errors explicitly. Never let a query fail silently.
- Config only through `firebase_options.dart` (FlutterFire CLI). Never expose config in code.
- Sensitive local data -> `flutter_secure_storage`.
- Firebase is accessed only inside repositories (never Cubit or Widget).
