# `#print axioms` dump

Recorded by `lake build OmegaZero34` against Lean 4.30.0-rc1 + Mathlib `v4.30.0-rc1`.
Date: 2026-08-28.

`native_decide` is used only for concrete \(4\times 4\) integer identities
(determinants, powers, `Tᵢᵀ Ω₀ Tᵢ = Ω₀`, dual fixed vectors, type normal
form). The uniqueness theorem and the restriction lemma do **not** use
`native_decide`.

## Concrete integer identities (`native_decide`)

These depend on `[propext, Classical.choice, Quot.sound]` plus a
compiler-checked `native_decide` axiom for the finite integer computation.

| Theorem | Extra axiom |
|---|---|
| `T1_det` | `T1_det._native.native_decide.ax_1_1` |
| `T1_pow_three` | `T1_pow_three._native.native_decide.ax_1_1` |
| `T2_pow_four` | `T2_pow_four._native.native_decide.ax_1_1` |
| `N_sq` | `N_sq._native.native_decide.ax_1_1` |
| `Ω0_skew` | `Ω0_skew._native.native_decide.ax_1_1` |
| `Ω0_det` | `Ω0_det._native.native_decide.ax_1_1` |
| `T1_preserves_Ω0` | `T1_preserves_Ω0._native.native_decide.ax_1_1` |
| `T2_preserves_Ω0` | `T2_preserves_Ω0._native.native_decide.ax_1_1` |
| `T0_preserves_Ω0` | `T0_preserves_Ω0._native.native_decide.ax_1_1` |
| `N_sp` | `N_sp._native.native_decide.ax_1_1` |
| `type_normal_form` | `type_normal_form._native.native_decide.ax_1_1` |
| `A1_fixes_ε` | `A1_fixes_ε._native.native_decide.ax_1_1` |
| `A2_fixes_ε'` | `A2_fixes_ε'._native.native_decide.ax_1_1` |

## Uniqueness and restriction (no `native_decide`)

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
