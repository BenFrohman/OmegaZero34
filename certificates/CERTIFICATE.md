# Certificates

Date: 2026-10-04. Scope is the lattice computation already kernel-checked in this repository, plus the order identity of Engel's presentation recorded as an input.

## Certified

The script `certificates/omega0_checks.py` checks, over the integer matrices in `OmegaZero34/Matrices.lean` and the form in `OmegaZero34/Form.lean`:

- `Omega0` is skew, determinant 36, Pfaffian 6, rank 4. Type (1,6).
- `T1^3 = I`, `T2^4 = I`, `det T1 = det T2 = det T0 = 1`.
- `N = T0 - I` satisfies `N^2 = 0`.
- `T_i^T Omega0 T_i = Omega0` for `i = 1, 2, 0`.

The same identities are the Lean kernel checks in `Matrices.lean`, `Form.lean`, `Uniqueness.lean`, `Nilpotent.lean`, and `Type.lean`.

## Recorded input, not a construction

Engel, arXiv:2609.38442, Proposition 6.1, gives the presentation

    pi1(Y) = < c, x0, x1 | c central, x0*x1 = 1, x0^3 = c^m, x1^4 = c^n >

with `m = 3*psi(a0)`, `n = 4*psi(a1)`, and order `|4*m + 3*n| = |12*psi(a0+a1)|`. For `m = 1`, `n = -1` the order is 1. The script checks that arithmetic in exact fractions. It does not derive the presentation from `Omega0`.

## Not certified

- Existence or holomorphicity of the compactification `X`.
- `pi1(X) = 1` as a theorem about a constructed space.
- Leray homology `H_*(X; Z) = H_*(S^6; Z)`.
- A diffeomorphism to `S^6`.
- A Frohmanian tether on `T^3` or a map `R^3 -> S^6`.

`TetherInterface.lean` remains the implication only: alternating, monodromy-invariant, and nondegenerate implies `omega = lambda Omega0`.
