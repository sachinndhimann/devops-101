# devops-101

A hands-on Docker + CI/CD + deployment course, built as a runnable
repository rather than a set of slides. You already know Python and
backend development — this skips programming basics and goes straight
at the engineering: containers, networking, build pipelines, secrets,
deployment strategies, and production debugging.

## Start here
1. Read `ROADMAP.md` for the full path.
2. `cp .env.example .env`
3. `make up` — brings up the sample app + Postgres + Redis (chapter7 territory,
   but useful as a running reference from day one).
4. Go to `chapter1/README.md` and work through in order.

## Structure
- `sample-app/` — the one app used everywhere, so context never resets.
- `chapterN/` — concept, mental model, diagram, runnable example, common
  failure + debug, exercise.
- `workflows/` — task-oriented runbooks ("I need to X") independent of
  chapter order — use these once you're past chapter 10 or so and just
  need to get something done.
- `final-project/` — a complete CI→staging→production pipeline that
  exercises everything from chapters 1-25.

## Philosophy
Every chapter follows: concept → mental model → diagram → minimal
implementation → run it → observe it → break it → debug it → production
implications → exercise. Diagrams are Mermaid, embedded directly in each
README so they render on GitHub/GitLab/most editors.

No real credentials or production deploy targets are ever hardcoded —
chapter16/chapter18 show you exactly what to fill in yourself.
