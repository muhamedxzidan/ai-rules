# ai-rules
Modular rules for AI coding agents (Flutter / Cubit / two-layer architecture).

- `AGENTS.md` is the router: always-on `core/` + task-matched `flutter/` files.
- One topic per file. Edit a rule in one place.
- `presets/` choose the platform scope: `flutter-mobile` or `flutter-multiplatform`.

Use in a project:

    ./sync-rules.sh flutter-mobile ../my_app [--with-agents]

In a synced project the rule files live under `.rules/` and `AGENTS.md` sits at the project root.
