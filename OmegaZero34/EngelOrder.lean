/-
Copyright (c) 2026 Benjamin Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Frohman
-/
import Mathlib.Tactic

/-!
# Arithmetic content of Engel's order formula

Engel, arXiv:2609.38442, Proposition 6.1, records a presentation

  π₁(Y) = ⟨ c, x0, x1 | c central, x0 x1 = 1, x0³ = c^m, x1⁴ = c^n ⟩

with `m = 3 ψ(a0)` and `n = 4 ψ(a1)`, and concludes that the group is cyclic of
order `|4*m + 3*n| = |12 ψ(a0+a1)|`.

This file formalizes only that integer identity. It does not construct `Y`,
does not prove the presentation, and does not prove `Y ≅ S⁶`.
-/

set_option autoImplicit false

namespace OmegaZero34

/-- The order formula is an equality of rationals: `4*m + 3*n = 12*(m/3 + n/4)`. -/
theorem engel_order_identity (m n : ℤ) :
    (4 * m + 3 * n : ℚ) = 12 * ((m : ℚ) / 3 + (n : ℚ) / 4) := by
  ring

/-- Absolute values agree, so the two writings of the order are the same. -/
theorem engel_order_natAbs (m n : ℤ) :
    Int.natAbs (4 * m + 3 * n) =
      Int.natAbs (12 * ((m : ℚ) / 3 + (n : ℚ) / 4)).num := by
  have h := engel_order_identity m n
  have hnum : ((4 * m + 3 * n : ℚ)).num = 4 * m + 3 * n := by
    simp
  rw [← h, hnum]

/-- The gluing values `m = 1`, `n = -1` give order 1. -/
theorem engel_order_unit :
    Int.natAbs (4 * (1 : ℤ) + 3 * (-1)) = 1 := by
  native_decide

/-- Same unit case through the `12 ψ` writing, with `ψ(a0)=1/3` and `ψ(a1)=-1/4`. -/
theorem engel_order_unit_psi :
    Int.natAbs (12 * ((1 : ℚ) / 3 + (-1 : ℚ) / 4)).num = 1 := by
  native_decide

/-- What this development does not formalize. Kept as documentation, not an axiom. -/
theorem not_a_diffeomorphism_certificate :
    Int.natAbs (4 * (1 : ℤ) + 3 * (-1)) = 1 :=
  engel_order_unit

end OmegaZero34
