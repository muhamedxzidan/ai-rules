# Feature Structure & Architecture

## Purpose
Two-layer, feature-first architecture. Intentional: NO domain layer.

## MUST
- Two layers only: **Data** (models, repositories) and **Presentation** (cubit, screens, widgets).
- Use-case logic lives inside the Cubit. Do NOT add `domain/` or UseCase classes, and do not suggest them.
- Every feature is self-contained and uses exactly this layout. `cubit/` is a direct child of the feature, NOT inside `presentation/`.

```
auth/
├─ cubit/
│  ├─ auth_cubit.dart
│  └─ auth_state.dart
├─ data/
│  ├─ models/user_model.dart
│  └─ repositories/
│     ├─ auth_repository_base.dart   # abstract (DIP)
│     └─ auth_repository.dart
└─ presentation/
   ├─ screens/login_screen.dart
   └─ widgets/{login_form,login_header}.dart
```

## core/ = shared infrastructure only
```
core/
├─ constants/      # AppColors, AppTextStyles, AppStrings, AppSizes, AppRoutes
├─ theme/
├─ network/
├─ errors/
├─ extensions/
├─ responsive/
└─ shared_widgets/
```
NO feature-specific code in `core/`.

## Data flow (strict)
`UI -> Cubit -> Repository -> Firebase / API / Local Storage`
Widgets never access repositories.
