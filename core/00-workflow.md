# Workflow (always on)

## Purpose
Make every change deliberate, minimal and traceable.

## MUST
1. Never write code immediately. For any non-trivial task output a `<plan>` first: files to touch, Cubit state changes, widget tree.
2. Trace the real flow before proposing a fix: `UI -> Cubit -> Repository -> Firebase/API/Local`.
3. Ask for clarification when requirements are unclear. Zero assumptions.
4. Challenge architecture violations, even if the user's wording implies them.
5. Wait for approval of the plan on non-trivial work (new feature, refactor, multi-file, state/data-flow change).
6. If implementation proves the plan wrong: STOP -> explain -> revised plan -> wait.

## Root cause (bugs)
- Fix the root cause, never the symptom.
- Touch the smallest possible number of files.
- Explain: where the action starts, who calls whom, where data transforms, exact change point.

## MUST NOT
- Invent layers (no `domain/`, no UseCase classes) to match a pattern.
- Refactor unrelated code.

## Checklist
- [ ] Plan shown (and approved when non-trivial)
- [ ] Root cause identified
- [ ] Scope minimal
