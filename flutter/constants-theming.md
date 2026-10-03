# Constants & Theming

## MUST
- No raw values anywhere in widgets: colors, text styles, strings, spacing, radii come from classes in `core/constants/`.
- One class per type: `AppColors`, `AppTextStyles`, `AppStrings`, `AppSizes` (and `AppRoutes`, see navigation).
- Theme definitions live in `core/theme/`.

```dart
// OK
color: AppColors.primary
style: AppTextStyles.heading1
Text(AppStrings.loginTitle)
padding: EdgeInsets.all(AppSizes.paddingMedium)
// BAD
Color(0xFF1976D2)   TextStyle(fontSize: 18)   Text('Login')   EdgeInsets.all(16)
```
Sizes inside `AppSizes` use ScreenUtil units (see responsive.md).
