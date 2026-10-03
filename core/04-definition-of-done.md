# Definition of Done (always on)

## Final report (every completed task)
1. Summary of changes
2. Edge cases handled
3. Terminal commands needed (e.g. `dart run build_runner build -d` only if codegen exists)
4. One Conventional Commit message

## Checklist
- [ ] One responsibility per touched class
- [ ] No logic in widgets; Cubits never touch Firebase/API directly
- [ ] Repository boundary clear
- [ ] No unrelated files changed
- [ ] UI checked on every platform class in the project preset
- [ ] No overflow / clipped content
- [ ] `dart format .`, `flutter analyze`, `flutter test` actually run (never claim a pass without running)
