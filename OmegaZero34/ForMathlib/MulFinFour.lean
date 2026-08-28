/-
Copyright (c) 2026 Benjamin Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Frohman
-/
import Mathlib.Data.Matrix.Mul
import Mathlib.Algebra.BigOperators.Fin

/-!
# Fin 4 matrix multiplication expansions

Generic expansions of `Matrix.mul` on `Fin 4`. No monodromy, no \(\Omega_0\).

**Upstream target:** `Mathlib.LinearAlgebra.Matrix.FinFour` (or fold into
`Mathlib.Algebra.BigOperators.Fin` + `Matrix.mul_apply`).
-/

set_option autoImplicit false

open Matrix

namespace Matrix

/-- Expansion of a `Fin 4` matrix product at a single entry. -/
lemma mul_apply_fin4 {R : Type*} [NonUnitalNonAssocSemiring R]
    (A B : Matrix (Fin 4) (Fin 4) R) (i j : Fin 4) :
    (A * B) i j = A i 0 * B 0 j + A i 1 * B 1 j + A i 2 * B 2 j + A i 3 * B 3 j := by
  rw [Matrix.mul_apply, Fin.sum_univ_four]

/-- Expansion of a triple `Fin 4` product `(A * B * C) i j`. -/
lemma mul3_apply {R : Type*} [NonUnitalNonAssocSemiring R]
    (A B C : Matrix (Fin 4) (Fin 4) R) (i j : Fin 4) :
    (A * B * C) i j =
      (A i 0 * B 0 0 + A i 1 * B 1 0 + A i 2 * B 2 0 + A i 3 * B 3 0) * C 0 j +
      (A i 0 * B 0 1 + A i 1 * B 1 1 + A i 2 * B 2 1 + A i 3 * B 3 1) * C 1 j +
      (A i 0 * B 0 2 + A i 1 * B 1 2 + A i 2 * B 2 2 + A i 3 * B 3 2) * C 2 j +
      (A i 0 * B 0 3 + A i 1 * B 1 3 + A i 2 * B 2 3 + A i 3 * B 3 3) * C 3 j := by
  simp [mul_apply, Fin.sum_univ_four]

end Matrix
