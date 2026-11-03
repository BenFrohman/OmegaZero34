<!-- Copyright (c) 2026 Benjamin Stanley Frohman. Licensed under Apache-2.0. -->
# `#print axioms` dump

Recorded by `lake build OmegaZero34` against Lean 4.30.0-rc1 + Mathlib `v4.30.0-rc1`.
Date: 2026-08-28.

**Update (2026-11-02):** every former `native_decide` proof has been replaced by a
kernel-checked proof (`decide`, `norm_num`, or `ext`/`fin_cases`/`simp`); no theorem
statement changed. The development no longer depends on `Lean.ofReduceBool`. Every
theorem and lemma now depends only on `[propext, Classical.choice, Quot.sound]` (or no
axioms); see `AxiomAudit.lean` and the *Lean certificate* CI workflow, which enforces this.

## Uniqueness and restriction

These depend only on `[propext, Classical.choice, Quot.sound]`.

| Theorem | Axioms |
|---|---|
| `invariant_params` | propext, Classical.choice, Quot.sound |
| `uniqueness_over_Q` | propext, Classical.choice, Quot.sound |
| `uniqueness_integral` | propext, Classical.choice, Quot.sound |
| `restriction_lemma` | propext, Classical.choice, Quot.sound |

The uniqueness proof is the twelve residual pairings, solved by substitution
(`a=0`, then `b=0`, then `e=f=0`, then `d=6c`). It does not quote a rank
computation.

## What the tether is

The tether, on this lattice, is the form `Ω0`. It is not the unipotent
logarithm `N` and not the Pfaffian `Pf(Ω0)=6`. Those are derived from the
form: `N ∈ sp(Ω0)`, and the Pfaffian is a scalar of `Ω0`.
