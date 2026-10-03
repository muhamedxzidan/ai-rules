# Existing Code First (always on)

## MUST (before creating anything)
1. Search `lib/` for a similar Model / Repository / Screen / Widget. Reuse it.
2. Inspect `pubspec.yaml` before adding a package; avoid heavy packages (APK size matters).
3. Inspect the feature's directory structure before editing.
4. Follow sound existing patterns; preserve unrelated behavior.

## No-Ghost-Code
When editing a file, never output `// ... existing code ...`. Provide exact, fully working code or use targeted edits. Never break existing logic to add a feature.
