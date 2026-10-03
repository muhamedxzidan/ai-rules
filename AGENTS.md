# AGENTS.md — Rules Router

Read this file first. Rule files live in `.rules/` (paths below are relative to it). It decides WHICH rule files you load. Do not load everything.

## 1. Always load (core)
- core/00-workflow.md
- core/01-oop-solid.md
- core/02-clean-code.md
- core/03-existing-code-first.md
- core/04-definition-of-done.md

## 2. Load by task (only the matching rows)

| Task | Load |
|---|---|
| New feature / new folder | flutter/feature-structure.md, flutter/data-layer.md, flutter/state-management.md |
| Cubit / state / search | flutter/state-management.md |
| Models / Repository / API / Firebase call | flutter/data-layer.md, flutter/firebase.md, flutter/errors-security.md |
| New screen / widget / UI change | flutter/ui-rules.md, flutter/constants-theming.md, flutter/responsive.md |
| Navigation / routes | flutter/navigation.md |
| Colors, strings, sizes, text styles | flutter/constants-theming.md |
| Bug fix | core/00-workflow.md (root cause section), flutter/errors-security.md |
| Naming, file size, comments, packages | flutter/conventions.md |
| Multi-agent / review / delegation (optional) | agents/orchestration.md, agents/delegation-brief.md |

## 3. Boundaries
- Apply ONLY the rules of the files you loaded for this task. If the task changes (e.g. bug fix turns into a new screen), load the new rows then.
- If the task fits no row, or two rows conflict: STOP and ask.
- Never invent rules. Never silently relax a rule.

## 4. Authority order
1. Explicit user instruction for the CURRENT task (applies to that task/rule only, never inferred)
2. This router + loaded rule files
3. Real source code / existing project architecture
4. Your own judgment

If a request conflicts with a loaded rule: STOP -> explain the conflict -> do not implement.

## 5. Presets
The project's preset (see presets/) decides platform scope (mobile only vs mobile+tablet+desktop). Check it when loading flutter/responsive.md.
