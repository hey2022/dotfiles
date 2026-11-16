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

Distinguish knowledge worth practicing from knowledge worth scheduling
through Anki. Routine exercises and calculations can remain in ordinary
practice without becoming cards. Preserve reusable methods and principles
when they constitute worthwhile retrieval tasks.

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

Use concise cue → clozed answer formats.

For a definition requiring only forward recall:

```html
[Term]<br>
{{c1::[Definition]}}
```

For definitions where both directions are useful, follow the bidirectional
recall rules below.

An explicit question is useful when it clarifies the task:

```html
How do you perform [task] under [conditions]?<br>
{{c1::[complete answer or procedure]}}
```

Cloze does not have to mean deleting individual words from prose.
A complete answer or process can be one cloze.

Use the same cloze number for material recalled together; different
numbers intentionally create separate scheduled cards. Avoid accidental
card multiplication or visible surrounding steps that give away answers.

Put supporting explanation in Extra. Keep material that must be actively
recalled in the tested content.

### Bidirectional recall

For term–definition pairs, prefer bidirectional recall when both directions
represent useful, independently testable knowledge.

Use separate cloze numbers within one AnKing note to generate two cards:

```html
{{c2::[Term]}}<br>
{{c1::[Definition]}}
```

- `c1`: Term → Definition.
- `c2`: Definition → Term.

Treat the two directions as distinct retrieval tasks. A reverse card should
test something the user genuinely needs to recognize or produce, not merely
the ability to associate an answer with its label.

Do not automatically reverse every card.

Prefer bidirectional recall for:

- Terms and their definitions.
- Concepts with distinctive descriptions that the user should identify.
- Other relationships where both directions are independently useful.

Prefer one direction for:

- Named laws or theorems → statements or formulas, unless recognizing the
  name from the statement is independently useful.
- Problem situations → appropriate methods or strategies.
- Tasks → procedures, proofs, derivations, or implementations.
- Questions whose reversed direction is trivial, ambiguous, or unnatural.

For example, recalling Gauss's law from its name is useful, but identifying
the name "Gauss's law" from its formula is not automatically worth a card.

Reverse definitions only when they identify the intended term sufficiently
clearly. Avoid reversed cards with multiple equally valid answers unless
the cue can be made unambiguous without revealing the answer.

Prefer one AnKing note with multiple cloze numbers over duplicate notes
when both directions concern the same knowledge.

Inspect the generated cards to verify that each direction provides enough
context, hides the intended answer, and does not reveal it elsewhere.

### One-by-one processes

For progressive recall of one process, use separate clozes with the same
number and set the `One by one` field to `1`:

```html
[Task or procedure cue]<br>
1. {{c1::First step.}}<br>
2. {{c1::Second step.}}<br>
3. {{c1::Third step.}}
```

This is one scheduled card with individually revealable steps.
Verify the live field name and behavior before writing.

Progressive revelation and recalling the whole answer before feedback
are different valid tasks. Use a single whole-answer cloze when that
better matches the intended practice.

### Cloze and MathJax safety

Put MathJax delimiters inside cloze deletions:

- Correct: `{{c1::\(a+b\)}}`
- Avoid: `\({{c1::a+b}}\)`

Anki may interpret the first literal `}}` after a cloze opening as its
terminator. Nested TeX braces can accidentally create this sequence.
Insert mathematically insignificant whitespace where necessary.

For example:

- Safe: `{{c1::\(\sqrt{\mathbf{v} }\)}}`
- Unsafe: `{{c1::\(\sqrt{\mathbf{v}}\)}}`

Use Anki MathJax `\(...\)` and `\[...\]`, and HTML for field formatting.
Where HTML parsing could interfere with mathematical comparison symbols,
prefer `\lt` and `\gt` inside MathJax.

Inspect the rendered question and answer for every generated cloze card,
including all siblings and reverse directions. Check for answer leakage,
broken MathJax, and unintended extra cards.

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

Most cards, including complete procedures recalled mentally, belong in
`Main::Primary`.

Reserve `Main::Construction` for tasks explicitly requiring written or
typed responses, currently primarily complete proofs and code
implementations. Length or multiple steps alone do not imply Construction.

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

Select worthwhile retrieval tasks at multiple levels, including:

- Essential definitions, theorem statements, and necessary conditions.
- Conceptual relationships, comparisons, and distinctions.
- Important examples and non-examples that clarify a concept.
- Recognizing applicable methods and diagnosing common misconceptions.
- Complete procedures, proofs, and implementations when recalling or
  constructing them is itself a meaningful performance task.

A whole-process card does not replace independently useful foundational
cards, and foundational cards do not replace whole-process retrieval.

Include both when they train distinct useful skills. Avoid redundant
restatements that test substantially the same knowledge.

Do not turn every exchange into a card or impose an arbitrary card quota.
Select retrieval tasks by learning value rather than target card counts.

After tutoring, create cards at the agreed time.

Before writing:

1. Establish the intended retrieval tasks.
1. Inspect relevant models and search for existing overlapping notes.
1. Select home decks and existing context/subject tags.

Provide drafts or previews when requested; otherwise carry out requested
creation once essential choices are known.

Read complete fields before editing; never write truncated excerpts back
into notes.

When source information is available, retain useful references in appropriate
fields such as Extra. Do not invent source locations or assume an unsupported
field exists.

### Supporting examples

When a short example would help the user recognize when knowledge applies,
include a concise example-form cue in Extra. Prefer examples illustrating
the retrieval target rather than unrelated worked problems.

Do not create an additional scheduled card merely to include an example.

For code-related knowledge, include exact relevant syntax or a concrete code
snippet when executable code is part of what must be recalled.

Preserve complete implementations when reconstruction is the intended task.
Do not replace executable syntax with pseudocode when the actual code is
the retrieval target.

### Visuals and media

Proactively consider visuals when spatial, geometric, structural, or
directional relationships are central to the retrieval task.

Use visuals only when they materially improve understanding or retrieval,
not merely for decoration.

Choose the representation appropriate to the task:

- An existing, accurate lecture figure when it already illustrates the idea.
- An original SVG, TikZ, plotted graph, or schematic for exact mathematical
  and computer-science relationships.
- An image-generation tool for illustrations where visual realism is useful
  and exact mathematical geometry is not required.

Prefer precise diagrams over generated illustrations when
correctness depends on geometry, orientation, labels, or scale.

Inspect all created or retrieved images before using them.

Verify mathematical and semantic correctness, including:

- Labels, units, axes, and coordinate conventions.
- Orientation, direction, vector order, and arrowheads.
- Scale and geometric relationships when they matter.
- Legibility at typical Anki review sizes.
- Sufficient contrast without relying solely on color.

Place visuals according to the retrieval task:

- Front: when interpreting the image is what the user must perform.
- Back or Extra: when the image explains or illustrates the answer.

Question-side images, captions, and alternative text must not reveal the
intended answer. Use separate unannotated and annotated versions when useful.

Use Anki MCP to store images, insert them into note fields, and verify
the resulting cards. Inspect images visually when possible; do not
claim visual verification based solely on HTML or metadata.

Preserve useful attribution when reusing third-party images.

### Card quality and revision

Evaluate every card as the learner will encounter it.

Before finalizing, inspect the answer-hidden front independently of the
answer, surrounding cards, and source material.

Verify that:

- The front specifies one clear retrieval task with sufficient context.
- The answer cannot be inferred from unintended hints or visible siblings.
- The expected response is independently assessable.
- Necessary assumptions, conditions, symbols, and directions are clear.
- The retrieval activity matches the intended deck and review method.
- Difficulty comes from meaningful retrieval rather than ambiguity or
  unnecessary bookkeeping.

Judge cognitive effort according to the actual task.

Mental recall cards should be reasonably reviewable without external tools.
Construction cards may require substantial written or typed work when that
is the intended performance.

Do not automatically split a coherent procedure, proof, or implementation
merely because it is difficult or lengthy.

When an existing card repeatedly fails, distinguish genuine difficulty
from poor card construction. Investigate ambiguity, insufficient context,
interference, excessive unrelated work, and answer leakage.

Revise poorly constructed cards when requested, but preserve genuinely
difficult, well-designed retrieval tasks.

Before handing over cards, check:

- Correct content, assumptions, and necessary qualifications.
- The cue and response train the intended performance.
- The user can assess a complete response.
- Clozes and generated card directions behave as intended.
- Images are visually inspected when possible, and Anki media
  references are verified.
- Home decks, tags, and inbox state are correct.

Batch compatible operations, check partial failures, and verify results
when possible. Report what was actually created or updated.

When the user syncs across devices, offer AnkiWeb sync before and after
substantial card operations when appropriate. Local MCP operations do
not sync implicitly.
