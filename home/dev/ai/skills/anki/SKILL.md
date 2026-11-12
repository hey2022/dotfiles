---
name: anki
description: Create, edit, and design Anki notes using the user's application-first retrieval principles, AnKing clozes, specialized models, course and subject tags, deck routing, and inbox workflow. Use when making cards, converting learning into spaced repetition, or designing note types.
---

# Anki

## Core principle: practice knowledge as it will be used

Design each card around:

- The situation that calls for the knowledge.
- The information available in that situation.
- What the user must recognize, recall, explain, produce, or execute.

The unit of a card is a meaningful unit of performance, not necessarily
one fact or step.

Preserve a whole procedure, proof, derivation, or reasoning flow when the
user will perform it as one unit—even if the answer is long. Do not split
it merely to satisfy the minimum information principle.

Distinguish coherent processes from arbitrary bundles of unrelated facts.
Component cards can supplement whole-process practice when independently
useful or needed for targeted practice.

Match the actual task: recognizing a method, executing it, recalling a
proof idea, and writing a proof are different retrieval goals.

Use necessary context without giving away the answer. Make the expected
response clear enough to assess, accepting equivalent correct answers
unless exact wording is itself the goal.

### Prefer concise, natural cues

Use the shortest cue that makes the intended retrieval task clear.
Do not turn every prompt into a full question.

For definitions, the term alone is usually sufficient: the user understands
that a bare term asks for its definition or meaning.

A theorem name, formula, diagram, or problem pattern can likewise serve as
the cue when the expected response is clear from established conventions.

Add explicit wording only when needed to distinguish the task, resolve
ambiguity, or state necessary conditions. For example, distinguish recalling
a theorem's statement from constructing its proof when the cue alone would
not make that clear.

Keep prompts concise without artificially shortening answers. A one-word
cue may require a substantial definition, explanation, or whole process.

## Note types: inspect the live collection

Use Anki MCP as the source of truth for models, fields, templates, tags,
and existing notes. Inspect relevant models and a few examples as needed;
reuse information already inspected during the session.

Do not maintain a fixed schema inventory or fetch every model. If MCP is
unavailable, ask for the necessary details or provide a labeled draft
rather than guessing fields.

### AnKing: default general-recall format

Prefer `AnKing`, the user's enhanced cloze model, over generic Cloze or
Basic for general recall.

Use concise cue → clozed answer formats. For a definition:

```html
[Term]<br /><br />
{{c1::[Definition]}}
```

An explicit question is useful when it clarifies the task:

```html
How do you perform [task] under [conditions]?<br /><br />
{{c1::[complete answer or procedure]}}
```

Cloze does not have to mean deleting individual words from prose.
A complete answer or process can be one cloze.

Use the same cloze number for material recalled together; different
numbers intentionally create separate scheduled cards. Avoid accidental
card multiplication or visible surrounding steps that give away answers.

Put supporting explanation in Extra. Keep material that must be actively
recalled in the tested content.

### One-by-one processes

For progressive recall of one process, use separate clozes with the same
number and set the `One by one` field to `1`:

```html
[Task or procedure cue]<br /><br />
1. {{c1::First step.}}<br />
2. {{c1::Second step.}}<br />
3. {{c1::Third step.}}
```

This is one scheduled card with individually revealable steps.
Verify the live field name and behavior before writing.

Progressive revelation and recalling the whole answer before feedback
are different valid tasks. Use a single whole-answer cloze when that
better matches the intended practice.

### Specialized models

Use suitable existing models for statements, proofs, strategies, and
structured objects. Relevant examples include `Mathmatical Statement`
(exact spelling), `Problem Strategy`, `VSEPR`, and `Geometric Shapes`.

The user welcomes new models for recurring objects with multiple useful
retrieval directions, such as diagram → name or equation → graph.

Choose meaningful directions rather than every possible permutation.
Inspect which cards populated fields generate. Distinguish proof ideas
from complete proofs; do not invent theorem names just to fill fields.

When designing a model, specify its fields, cue → response relationships,
and conditional card generation. Create or change models when requested;
remember that template changes affect other notes using the model.

## Tags: context and subject are independent

Organize primarily through existing tags.

- Course/source context: `UIUC::CS::173`, `tsinglan::linear-algebra`.
- Subject: `math::set-theory`, `math::graph-theory`,
  `math::linear-algebra`.

Use both dimensions when applicable. Inspect and preserve existing spelling
and hierarchy. Do not apply a course tag to unrelated material or invent
a replacement taxonomy.

Reuse equivalent knowledge across courses and add context tags rather
than duplicating notes solely for another class. Distinct useful retrieval
tasks are not necessarily duplicates.

## Home decks: activity and priority

- `Main::Primary`: default for current, normal-priority recall.
- `Main::Secondary`: lower-priority material; lower desired retention.
- `Main::Construction`: tasks requiring writing or typing, such as written
  proofs and implementations; scheduling is tuned for that activity.

Length alone does not imply Construction. A long mentally rehearsed process
can belong in Primary.

Route by the actual task. Decks are card-level: one note may generate
written-proof cards for Construction and statement-recall cards for Primary.

Ask when the intended activity is unclear or lower-priority Construction
material needs a routing decision. That combination is not yet established.

Filtered decks are study views, not destinations for new notes.
Do not change scheduling or rebuild filtered decks unless requested.

## Inbox: AI-complete is not user-reviewed

All AI-created notes receive `inbox`, including "ready-to-study" requests.
Create complete, checked content; inbox is not an excuse to leave errors.

- Workspace: `inbox` and not suspended.
- Deferred backlog: `inbox` and suspended.
- Accepted notes: `inbox` removed.

New cards remain unsuspended for the active creation workspace.
Remove `inbox` only when the user indicates acceptance or requests removal.
Suspend deferred material when requested, not automatically.

Saved workspace search:

```text
tag:inbox -is:suspended
```

The filtered workspace study deck additionally restricts cards to:

```text
(is:due OR is:new)
```

The user also captures incomplete lecture placeholders. Preserve these
when requested without inventing missing content or treating them as finished.

Tags affect whole notes. Before removing `inbox` from a multi-card note,
check that all intended cards are ready.

## Selection, formatting, and workflow

When converting learning into cards, prioritize reusable concepts,
conditions, methods, whole processes, and demonstrated misconceptions.
Do not turn every exchange into a card or impose an arbitrary card quota.
After tutoring, create cards at the agreed time.

Before writing:

1. Establish the intended retrieval tasks.
2. Inspect relevant models and search for existing overlapping notes.
3. Select home decks and existing context/subject tags.

Provide drafts or previews when requested; otherwise carry out requested
creation once essential choices are known. Read complete fields before
editing; never write truncated excerpts back into notes.

Use Anki MathJax `\(...\)` and `\[...\]`, and HTML for field formatting.
Check cloze boundaries around mathematical braces. Use stored Anki media
for visual tasks.

Before handing over cards, check:

- Correct content, assumptions, and necessary qualifications.
- The cue and response train the intended performance.
- The user can assess a complete response.
- Clozes and generated card directions behave as intended.
- Home decks, tags, and inbox state are correct.

Batch compatible operations, check partial failures, and verify results
when possible. Report what was actually created or updated.

When the user syncs across devices, offer AnkiWeb sync at the start and
end. Local MCP operations do not sync implicitly.
