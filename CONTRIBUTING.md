# Contributing, authorship, and upstream rules

This repository has two layers. Treat them differently.

1. **This note (Ω₀, uniqueness, restriction lemma, preprint).** Author: Benjamin Stanley Frohman. Cite Alpöge for \(T_1,T_2\) and the compactification *claim*. Do not send this layer to Mathlib.
2. **Generic lemmas in `OmegaZero34/ForMathlib/`.** Same author. These are the only files shaped for a public PR to [mathlib4](https://github.com/leanprover-community/mathlib4) (or, later, Lean 4). Follow **that community’s rules**, not a private convention.

A public PR is not authored until the **host community’s** checklist is satisfied. Git history on this laptop is not enough.

---

## Mathlib (current, August 2026)

Source: [How to contribute to mathlib](https://leanprover-community.github.io/contribute/how-to-contribute.html), [Git guide](https://leanprover-community.github.io/contribute/git.html), [style guide](https://leanprover-community.github.io/contribute/style.html), [PR template](https://github.com/leanprover-community/mathlib4/blob/master/.github/PULL_REQUEST_TEMPLATE.md).

**Before a PR**

- Discuss on [Zulip](https://leanprover.zulipchat.com/). Introduce yourself. Put your **GitHub username** on your Zulip profile. Use your real name as the Zulip display name.
- Work on a **fork**, PR into `leanprover-community/mathlib4` `master` (not into your fork’s master).
- Small, self-contained PRs. New theory is often better as a standalone repo first; Mathlib has a large review queue.
- If AI was used, say so in the PR description and add the `LLM-generated` label (comment `LLM-generated` on the PR). Using an LLM to write GitHub or Zulip comments is not allowed.
- Master must compile and must not contain unfinished proofs. Same for any PR that is not labelled `WIP`.

**Authorship Mathlib actually checks**

Mathlib does **not** have a `/author` bot. Authorship is established by **all** of the following:

1. **File header** (CI-linted). Use `Authors:` even for one person. Commas between names. No `and`. No trailing period. No double spaces.

   ```
   /-
   Copyright (c) 2026 Benjamin Frohman. All rights reserved.
   Released under Apache 2.0 license as described in the file LICENSE.
   Authors: Benjamin Frohman
   -/
   ```

   The `Authors:` list is who to ping about design, not a census of every git committer.

2. **Git commit author** matching a GitHub account (email GitHub knows). For this author that is **not** optional and **not** an `@local` placeholder:

   ```
   git config user.name "Frohmanian"
   git config user.email "frohmanbenjamin@gmail.com"
   ```

   GitHub login `BenFrohman` (id `282656011`, display name `Frohmanian`) already has `frohmanbenjamin@gmail.com`. The contribution graph counts **author email**, not the display name. An agent identity as the only author (`benjamin.frohman@local`, a bot, a laptop placeholder) does **not** appear on that graph.

3. **Squash merge.** Mathlib squashes the PR. Co-authors on the squash commit come from:
   - authors of commits **on the PR branch**, and/or
   - `Co-authored-by: Name <email>` lines in the PR description **immediately above** the `---` in the template.

   If you need your name on a squash and the commits were made under another identity (agent, laptop, co-worker), add an **empty commit** authored as you:

   ```
   git commit --author="Frohmanian <frohmanbenjamin@gmail.com>" --allow-empty -m "add Frohmanian as author"
   git push
   ```

   The SHA of that commit is the authorship evidence. Keep it.

4. **PR comment after the first push** (WIP included). Mathlib has no `/author` command. Do this on the PR so the SHA is public and tied to your GitHub login:

   ```
   Author: Benjamin Stanley Frohman
   HEAD: <paste git rev-parse HEAD>
   ```

   Then, **one label per line** in a comment (anyone can do this):

   | Comment | Effect |
   |---|---|
   | `WIP` | work in progress; not for review until green and `-WIP` |
   | `-WIP` | remove WIP |
   | `awaiting-author` / `-awaiting-author` | review ping-pong |
   | `LLM-generated` | substantial LLM-generated code |
   | `t-algebra` etc. | topic labels |
   | `help-wanted` / `please-adopt` | asking for help |

   After review, remove `awaiting-author` yourself. A maintainer merges with `bors merge` / `bors r+`. If the PR is **delegated**, *you* comment `bors merge` once CI is green. Delegations expire in two weeks.

5. **First-time GitHub contributor.** GitHub will **not** run Actions until a collaborator approves the workflow for that SHA. Wait for that approval. Re-pushing a first PR often needs approval again. That approval is not authorship; it is CI.

6. **Zulip.** Mention the PR number in `#mathlib4` or `#PR reviews`. Link GitHub ↔ Zulip. Reviewers look at the [review queue](https://leanprover-community.github.io/queueboard/review_dashboard.html); unlabelled / failing CI PRs often sit invisible.

**Do not**

- Open the PR against your own `master`.
- Rebase after review has started (merge `master` instead; Mathlib squashes anyway).
- Put Ω₀, \(T_1\), \(T_2\), or a tether story in a Mathlib file.
- Claim `X ≃ S^6` in a Mathlib PR.
- Let an agent’s GitHub identity be the only commit author. Every commit of work we produce must be authored **and** committed as `Frohmanian <frohmanbenjamin@gmail.com>` so it lands on the `BenFrohman` GitHub graph.

---

## Lean 4 core (`leanprover/lean4`)

Same spirit: fork, PR, real name, copyright header if the file uses one, commit author = GitHub identity. Lean 4 is not Mathlib; read [lean4 CONTRIBUTING](https://github.com/leanprover/lean4/blob/master/CONTRIBUTING.md) before opening anything. The ForMathlib files here are **Mathlib-shaped**, not Lean-core-shaped, unless a lemma belongs in core `Init`.

---

## This repository

- Copyright on Lean: Apache-2.0, Benjamin Stanley Frohman (`LICENSE`, `AUTHORS.md`, `COPYRIGHT.md`).
- Preprint: CC-BY-4.0, same author (`preprint/main.tex`).
- Alpöge is a **citation**, not a co-author.

### GitHub contribution graph (required for all work we produce)

GitHub paints a square on **BenFrohman** only when **both** `Author` and `Committer` emails are addresses that account already has. Use this identity on every commit, in this repo and in every other repo we produce:

```
git config user.name "Frohmanian"
git config user.email "frohmanbenjamin@gmail.com"
```

Same values for `GIT_AUTHOR_*` and `GIT_COMMITTER_*` if an environment overrides config.

Never use `benjamin.frohman@local`, `*@local`, a coding-agent identity, or an empty `--author` commit as the **only** author of original work.

This clone has a hook at `.githooks/pre-commit` that refuses those emails. Enable it once:

```
git config core.hooksPath .githooks
```

If a commit already has the wrong author and has **not** been pushed:

```
GIT_AUTHOR_NAME="Frohmanian" GIT_AUTHOR_EMAIL="frohmanbenjamin@gmail.com" \
GIT_COMMITTER_NAME="Frohmanian" GIT_COMMITTER_EMAIL="frohmanbenjamin@gmail.com" \
git commit --amend --reset-author --no-edit
```

If it has been pushed, rewrite only with an explicit force-push decision; GitHub will recount the new SHAs on the graph and drop the old ones.

After every commit that should count:

```
git log -1 --format='Author: %an <%ae>%nCommitter: %cn <%ce>%nSHA: %H'
```

Both emails must be `frohmanbenjamin@gmail.com`. Put that SHA on any public PR in a comment as above.

WIP branches in this repo should still have `Authors: Benjamin Frohman` in every new Lean file. Do not wait until “final” to set the header; Mathlib CI will reject the PR if the header is wrong.

---

## Checklist before a Mathlib PR from `ForMathlib/`

- [ ] Discussed on Zulip; GitHub username is on the Zulip profile
- [ ] Only `ForMathlib/` files; no `OmegaZero34.Matrices` / `Form` / `Uniqueness` imports
- [ ] Header is the three-line Apache form with `Authors: Benjamin Frohman`
- [ ] `git log` authors (and committers) are `Frohmanian <frohmanbenjamin@gmail.com>` (or empty `--author` commit exists under that identity)
- [ ] First-push PR comment with full `HEAD` SHA
- [ ] `WIP` comment until CI is green, then `-WIP`
- [ ] If an agent wrote code: `LLM-generated` and a human-written description of what was generated
- [ ] PR title follows Mathlib commit conventions (`feat:`, `chore:`, …)
- [ ] After merge, this repo’s `ForMathlib/README.md` records the Mathlib PR number
