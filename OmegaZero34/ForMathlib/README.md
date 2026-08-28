# ForMathlib (upstream candidates)

Author: **Benjamin Stanley Frohman**, Apache-2.0.

These modules contain **only** general matrix lemmas. They do not mention
\(\Omega_0\), triangle groups, or a tether. They are the form a Mathlib or
Lean 4 PR should take: `Authors: Benjamin Frohman` in the file header,
no import of `OmegaZero34.Matrices` / `Form` / `Uniqueness`.

| File now | Intended Mathlib path | Content |
|---|---|---|
| `MulFinFour.lean` | `Mathlib.LinearAlgebra.Matrix.FinFour` | `mul_apply_fin4`, `mul3_apply` |
| `SkewFour.lean` | `Mathlib.LinearAlgebra.Matrix.Skew.Four` | `skewFour`, Pfaffian-of-parameters, reconstruction from \(\Omega^T=-\Omega\) |

Novel, representation-specific results (`T1`, `T2`, `Ω0`, uniqueness of
the invariant form on this monodromy) stay in `OmegaZero34/*.lean` and
are **not** proposed for Mathlib.

When opening a Mathlib PR: copy the file, change the module path, keep
the copyright header, and do not add Ω₀.

**Authorship on that PR is not automatic.** Mathlib has no `/author` bot.
See the root `CONTRIBUTING.md`. Minimum:

1. `Authors: Benjamin Frohman` in the file header (CI-linted; plural `Authors`, no period).
2. Git commits authored as Benjamin Stanley Frohman with a GitHub-known email.
   If commits were made by an agent, add
   `git commit --author="Benjamin Stanley Frohman <EMAIL>" --allow-empty`
   so the squash merge still lists you.
3. After the first push, comment on the PR:

   ```
   Author: Benjamin Stanley Frohman
   HEAD: <git rev-parse HEAD>
   ```

   Then `WIP` (own line) until CI is green; `-WIP` when ready for review.
4. Introduce the PR on Zulip with your GitHub username in your Zulip profile.
5. First-time GitHub contributors: a maintainer must approve Actions for
   that SHA before CI runs.

Until those steps happen, a WIP PR is not an established public authorship
record, even if this private repo has a dated tag.
