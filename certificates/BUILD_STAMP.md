# Build stamp

Date: 2026-10-04.

## Integer certificate

`certificates/omega0_checks.py` re-executed: form skew, det 36, Pfaffian 6, rank 4, `T1^3 = I`, `T2^4 = I`, `N^2 = 0`, and `T_i^T Omega0 T_i = Omega0` for `i = 1, 2, 0`. Engel order identity `|4*m + 3*n| = 1` for `m = 1`, `n = -1` recorded as an input, not a construction.

## Lean CI

- Successful `lake build`: https://github.com/BenFrohman/OmegaZero34/actions/runs/37188807102 (sha `2a79c1e0813aad9e43e9779a4933e437bf878a65`, conclusion success).
- Fresh dispatch: https://github.com/BenFrohman/OmegaZero34/actions/runs/37195695316 (same sha).

## Lattice theorem location

Unchanged: `OmegaZero34/Uniqueness.lean` and `OmegaZero34/TetherInterface.lean`.

- `uniqueness_over_Q` / `uniqueness_integral`: monodromy-invariant alternating form is a scalar multiple of `Omega0`.
- `restriction_lemma`: alternating + `T1`/`T2`-invariant + nondegenerate implies `omega = lambda Omega0` with `lambda != 0`.

Axioms on those theorems: `propext`, `Classical.choice`, `Quot.sound`.

Not certified: existence of `X`, `pi1(X) = 1`, Leray homology, diffeomorphism to `S^6`.
