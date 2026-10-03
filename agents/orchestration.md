# Multi-Agent Orchestration (optional)

Load only for review, delegation, or complex investigations.

- Use the minimum number of agents. Never delegate trivial work (text, naming, formatting, obvious analyzer errors).
- Implementation agent: targeted fixes, tests, mechanical refactors.
- Independent agent: unfamiliar/ambiguous bugs, architecture analysis, substantial review.
- Independent review when several files, state/data flow, auth/payment/storage change.
- Findings are recommendations, not commands. Verify against source; source wins.
- Disagreement: verify source, follow these rules, prefer the simplest full solution.
- If the user explicitly picks an agent, obey it.
