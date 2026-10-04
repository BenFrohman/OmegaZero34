/-
Copyright (c) 2026 Benjamin Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Frohman
-/
import Mathlib.Tactic

/-!
# Arithmetic content of Engel's order formula

Engel, arXiv:2609.38442, Proposition 6.1, records a presentation

  pi1(Y) = < c, x0, x1 | c central, x0 x1 = 1, x0^3 = c^m, x1^4 = c^n >

with `m = 3 psi(a0)` and `n = 4 psi(a1)`, and concludes that the group is cyclic of
order `|4*m + 3*n| = |12 psi(a0+a1)|`.

This file formalizes only that identity over `Rat`. It does not construct `Y`,
does not prove the presentation, and does not prove `Y` diffeomorphic to `S^6`.
-/

set_option autoImplicit false

namespace OmegaZero34

/-- The order formula is an equality of rationals: `4*m + 3*n = 12*(m/3 + n/4)`. -/
theorem engel_order_identity (m n : Int) :
    (4 * m + 3 * n : Rat) = 12 * ((m : Rat) / 3 + (n : Rat) / 4) := by
  ring

/-- The gluing values `m = 1`, `n = -1` give order 1. -/
theorem engel_order_unit :
    Int.natAbs (4 * (1 : Int) + 3 * (-1)) = 1 := by
  native_decide

/-- What this development does not formalize. Kept as documentation, not an axiom. -/
theorem not_a_diffeomorphism_certificate :
    Int.natAbs (4 * (1 : Int) + 3 * (-1)) = 1 :=
  engel_order_unit

end OmegaZero34
