# Clean Code (always on)

## Purpose
Simple, readable, lightweight code.

## MUST
- Prefer the simplest solution. If a package adds heavy complexity for a small gain, propose a simpler alternative and explain the trade-off.
- Use `const` constructors wherever possible; `StatelessWidget` by default.
- Use modern Dart where it adds clarity: sealed classes, pattern matching, records.
- Names reveal intent. Small functions, one level of abstraction each.
- No dead, ghost or placeholder code.

## MUST NOT
- Duplicate business rules.
- Leave commented-out code.
- Add speculative features.
