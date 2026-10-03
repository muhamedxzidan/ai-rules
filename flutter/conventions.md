# Conventions

## Naming
| Type | Convention | Example |
|---|---|---|
| Files & folders | snake_case | `login_cubit.dart` |
| Classes | PascalCase | `UserModel` |
| Variables & methods | camelCase | `fetchUserData()` |
| Responsive names | purpose + target | `tabletCardWidth` |

## Size
- File > 200 lines -> split. Widget > 100 lines -> split.

## Comments
- Non-trivial logic gets a short comment (Arabic or English): what, why (if not obvious), side effects.
- Public methods of Repositories and Cubits get `///` doc comments.

## Packages & platform
- Core stack: flutter_bloc, flutter_screenutil, firebase_auth, cloud_firestore, firebase_storage, flutter_secure_storage. Navigation built-in. Models manual.
- Default target: Android arm64-v8a, manual APK. Watch APK size; justify any heavy package.
