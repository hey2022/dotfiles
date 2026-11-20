---
name: anki
description: Create, edit, and design Anki notes using the user's application-first retrieval principles, AnKing clozes, specialized models, course and subject tags, deck routing, and inbox workflow. Use when making cards, converting learning into spaced repetition, or designing note types.
---

# Anki

## Core principle: practice knowledge as it will be used

Match the cue to the situation, the information available, and what the
user must recall or do. Recognizing a method, executing it, recalling a
proof idea, and writing a proof are different retrieval tasks.

A card tests one meaningful task, not necessarily one fact or step. Keep
a procedure, proof, derivation, or reasoning flow together when the user
will perform it as a unit. Add component cards only when they train
something independently useful or target a specific weak point.

Whole-process and component cards can coexist when they train distinct,
independently useful retrieval tasks; neither automatically replaces
the other.

Schedule reusable knowledge worth retrieving. Leave routine exercises and
calculations to ordinary practice unless the task itself is worth recalling.

### Keep tested answers lean

The default is a short, assessable answer—often one sentence or a few
key moves—not an essay. Length is justified only when the user is
actually performing the whole unit as one retrieval task.

- For procedures, omit redundant micro-steps while preserving all
  essential moves needed to reconstruct the intended process, whether
  mentally or in writing. Keep complete details when accurate written
  or typed construction is the retrieval task.
- Put illustrative examples in Extra. Keep an example in the tested answer
  when producing one is the task, such as giving a counterexample.
- If an answer is a list of independent facts, split it only when each
  component is independently useful.
- Do not exclude a proposed card merely because it is a general fact.
  General principles and definitions are valid retrieval targets. Exclude
  only trivial, duplicated, or low-value proposed cards.
- If a card is vague, add the missing context to the cue rather than
  padding the answer.

### Prefer concise, natural cues

Use the shortest natural cue that makes the retrieval task clear without
giving away the answer. A term alone usually cues a definition. A theorem
name, formula, diagram, or problem pattern can also suffice when the
expected response is clear from convention.

Add wording when it changes what's being asked: when to use a method versus
how to execute it, or stating a theorem versus writing its proof. Include
necessary conditions. Accept equivalent answers unless exact wording is
the task.

Cue the whole task when the user needs to perform it as a unit. For example,
“How do you prove that (f:A\\to B) is surjective?” cues the full proof
flow; “You’ve solved (f(x)=y)” cues only what comes after finding a
candidate input.

## Note types: inspect the live collection

Use Anki MCP as the source of truth for models, fields, templates, tags,
and existing notes. Inspect relevant models and a few examples as needed;
reuse information already inspected during the session.

Do not maintain a fixed schema inventory or fetch every model. If MCP is
unavailable, ask for the necessary details or provide a labeled draft
rather than guessing fields.

Some add tools reject a note unless every field key is present. Pass unused
fields as empty strings; this is a request-shape requirement, not a content
rule.

### AnKing: default general-recall format

Prefer `AnKing` over generic Cloze or Basic for general recall, unless a
specialized model better fits the intended task.

Use concise cue → clozed answer formats.

For a definition requiring only forward recall:

```html
[Term]<br>
{{c1::[Definition]}}
```

An explicit question is useful when it clarifies the task:

```html
How do you perform [task] under [conditions]?<br>
{{c1::[complete answer or procedure]}}
```

One cloze can hide a complete answer or process. Use the same number for
material recalled together and different numbers for separate cards.

Put supporting explanation in Extra. Keep material that must be actively
recalled in the tested content.

#### Formula cards

Show the equation structure when it helps specify what's being recalled.
For a one-way formula, usually show the left side and cloze the right:

```html
Polar area element: \(dA={{c1::r\,dr\,d\theta}}\)
```

For a named formula, a cue line followed by the whole formula as one cloze
may read more naturally:

```html
Polar area element<br>
{{c1::\(dA=r\,dr\,d\theta\)}}
```

Define unfamiliar symbols on the front if the user needs them to answer,
unless their meaning is itself being tested. Use Extra for notation notes
that are helpful but not needed to answer.

### Bidirectional recall

Use both directions only when each is useful and independently assessable.
For bidirectional term–definition recall in `AnKing`, use one note with
separate clozes:

```html
{{c2::[Term]}}<br>
{{c1::[Definition]}}
```

- `c1`: Term → Definition.
- `c2`: Definition → Term.

For each definition, decide explicitly whether recognizing the term from
its description is worth practicing. Reverse it only if the description
identifies the intended term without giving it away. When adding a reverse
card to an existing note, preserve the wording unless a wording change is
separately proposed for review. Prefer one direction for named laws or theorems,
situations → methods, and tasks → procedures, proofs, or implementations.
For example, recalling Gauss's law from its name does not imply the name is
worth recalling from the formula.

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

Use one-by-one only for a genuine multi-step procedure, and only for the
key moves—usually 3–4 steps, not every algebraic micro-step. Do not add
a step for an action already implied by a later step, such as “compute the
Jacobian” immediately before “multiply by the Jacobian.”

Progressive revelation and recalling the whole answer before feedback
are different valid tasks. Use a single whole-answer cloze when that
better matches the intended practice.

### Cloze and MathJax safety

Both of these work:

- MathJax inside the cloze: `{{c1::\(a+b\)}}`
- MathJax outside the cloze: `\(a+b={{c1::c}}\)`

Within clozed MathJax, adjacent TeX closing braces can be read as the
cloze terminator. Insert harmless whitespace between those braces:

- Safe: `{{c1::\(\sqrt{\mathbf{v} }\)}}`
- Unsafe: `{{c1::\(\sqrt{\mathbf{v}}\)}}`

Use Anki MathJax `\(...\)` and `\[...\]`, and HTML for field formatting.
Where HTML parsing could interfere with mathematical comparison symbols,
prefer `\lt` and `\gt` inside MathJax.

### Specialized models

Use suitable existing models for statements, definitions, proofs,
strategies, and structured objects. Relevant examples include
`Mathmatical Statement` (exact spelling), `Problem Strategy`, `VSEPR`,
and `Geometric Shapes`.

Prefer `Mathmatical Statement` for named definitions and theorems when
their natural-language and formal/symbolic versions support distinct,
useful retrieval tasks (such as stating, identifying, or translating).
Use AnKing for simpler term–meaning recall, lists, procedures, or when
the specialized model would generate unnecessary retrieval directions.

Choose based on the intended retrieval tasks and the cards the actual
templates generate, not merely the shape of the knowledge or which
models neighboring notes use. Do not create reverse cards solely
because a model supports them.

For definition notes in `Mathmatical Statement`, write a concise prose
characterization in `Statement` that identifies the concept without naming
it, e.g. "a graph homomorphism that is left-cancellative." The Identify
card uses `Statement` as its cue and falls back to `Formal` if `Statement`
is blank. Set `Name` to `Definition of X` for the State prompt. Make sure
the State answer includes any condition the user is meant to recall.

Add a symbolic version in `Formal` only when translating between the two
versions in both directions is worth practicing. Leaving `Formal` blank
skips the Translate and Meaning cards.

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

A filtered deck is a snapshot: removing `inbox` or changing suspension does
not update a built deck until it is rebuilt. Rebuild only when requested.

Editing a deferred note can create new sibling cards—for example, adding a
new cloze number. Suspend those siblings too and re-check that the backlog
is still fully suspended.

The user also captures incomplete lecture placeholders. Preserve these
when requested without inventing missing content or treating them as finished.
When a placeholder admits more than one reading, infer from the course,
tags, neighbouring notes, and recent work. If the readings remain plausible,
ask or leave the note suspended rather than choosing one.

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

If two cards test the same thing, keep one and move useful detail into
Extra. Don't turn every exchange into a card or aim for a fixed count.

After tutoring, start card creation at the agreed time. Default to the draft
review below for tutoring batches and follow-ups. A request like “add those
definitions” selects the content; it does not waive review. Skip review only
if the user explicitly asks to add the batch without drafts. During review,
“accept all” approves the rest of the current batch.

Before drafting, establish the intended retrieval tasks, inspect relevant
models and templates, search for overlapping notes, and select appropriate
home decks and existing context/subject tags.

Outside draft review, provide previews when requested; otherwise carry out
requested creation once essential choices are known.

Read complete fields before editing; never write truncated excerpts back
into notes.

Before drafting course cards, check the workspace for the course's own
materials—lecture notes, readings, problem sets. When they exist, follow
their definitions, notation, and terminology even if a standard textbook
differs, and record the source in Extra. Without such a source, use
standard knowledge without claiming that its wording or notation matches
the course exactly. Preserve course context tags when the user has
established that context.

### One-at-a-time draft review

Start with one representative note. Prefix every draft with `[i/n]`, where
`i` is the current note and `n` is the number of notes currently planned for
this batch. Count a note with sibling cards once. If the plan changes, update
the denominator and briefly say why. Show the exact Anki note type on every
draft, even when it is unchanged from the previous draft.

Show the exact wording of each proposed card. For AnKing, show the exact
cloze text once, preserving wording, line breaks, and cloze numbers. If the
note generates multiple cards, list what each cloze tests (e.g., `c1`:
term → definition; `c2`: definition → term). Show separate front/back
previews only if requested; preserve the same note text across siblings and
change only which part is hidden. For other models, show only the cards the
populated fields and live templates will generate. Show Extra only when it
matters. Do not write to Anki during the review.

- **Comment:** Revise the current draft and apply the feedback to other
  drafts where it fits. Keep topic-specific feedback scoped to that topic.
  A material change to an approved cue, tested answer, or set of sibling
  cards voids its individual approval; show the revision for reapproval.
- **Approve:** Keep the draft and show the next one. Pick a different example
  that tests whether the feedback carries over. Write the batch once all
  drafts are approved.
- **Accept all:** Stop previewing, finish the rest of the current batch using
  the feedback so far, and write the whole batch.

For new notes, batch-create them with `inbox`, even if approved in chat.
When reviewing existing notes, use the current notes as drafts and show
revisions in chat. Apply the approved changes in place at the end and verify
the resulting cards. Leave other notes and existing inbox status unchanged
unless the user asks otherwise.

Save feedback for future sessions only when the user asks.

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

Before writing, check every intended front in isolation, with no answer,
neighboring cards, or source material. Confirm that it sets a clear task
without giving away the answer, and that the expected answer is correct and
assessable. Check assumptions and scope; don't present a special case as
the general rule. Mental recall should be workable without external tools;
substantial written or typed work is fine when that is the task.

When an existing card repeatedly fails, distinguish genuine difficulty
from poor card construction. Investigate ambiguity, insufficient context,
interference, excessive unrelated work, and answer leakage.

Revise poorly constructed cards when requested, but preserve genuinely
difficult, well-designed retrieval tasks.

Batch compatible writes and check for partial failures. After writing,
verify generated fronts and backs, including all siblings, for missing or
unintended cards, answer leakage, broken MathJax, and media references.
Check home decks, tags, and inbox state. Report what was actually created
or updated and flag any checks that couldn't be done.

When the user syncs across devices, offer AnkiWeb sync before and after
substantial card operations when appropriate. Local MCP operations do
not sync implicitly.
