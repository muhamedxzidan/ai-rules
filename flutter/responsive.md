# Responsive & Adaptive UI

## Platform scope = the project preset
- `flutter-mobile` preset: mobile + tablet.
- `flutter-multiplatform` preset: mobile + tablet + desktop (Windows/Web).
Check the preset before designing layouts.

## ScreenUtil (when the project uses `flutter_screenutil`)
- width/spacing -> `.w`, height -> `.h`, font -> `.sp`, radius -> `.r`. No hardcoded pixel values.
- ScreenUtil scales visuals; it does NOT replace layout logic. Use constraints for structure.

## Layout adaptation
- When the layout structure differs per screen class, use `ResponsiveLayout` from `core/responsive/`. Do not just enlarge the mobile UI.
- Use `Expanded`, `Flexible`, `LayoutBuilder`, `Wrap`, `AspectRatio`, and max-width containers on large screens.
- Prevent overflow, clipped content, fixed-width assumptions and unusable stretching.
- Names state their purpose and target: `tabletSidebarWidth`, `mobileCardPadding`.

```dart
ResponsiveLayout(
  mobileLayout: const MobileHomeScreen(),
  tabletLayout: const TabletHomeScreen(),
  desktopLayout: const DesktopHomeScreen(), // optional; falls back to tablet
)
```

## Verify
Every UI change is checked on each platform class in the preset (portrait + landscape where relevant).
