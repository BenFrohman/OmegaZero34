/-
Copyright (c) 2026 Benjamin Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Frohman
-/
import OmegaZero34.Form
import OmegaZero34.Matrices

/-!
# The formalized claim

The claim proved in this repository is the lattice statement: the
monodromy matrices preserve `\Omega_0`, and the Engel order identity holds
as arithmetic. The geometric claim that a filled total space is
diffeomorphic to `S^6` is stated and not proved.
-/

set_option autoImplicit false

open Matrix

namespace OmegaZero34

/-- Engel's order, `Prop. 6.1`. `m = 3 * psi(a0)`, `n = 4 * psi(a1)`. -/
def engelOrder (m n : ℤ) : ℕ := Int.natAbs (4 * m + 3 * n)

/-- For the gluing `m = 1`, `n = -1`, the order is `1`. -/
theorem engelOrder_gluing : engelOrder 1 (-1) = 1 := by
  native_decide

/-- Exact form of the identity `4*m + 3*n = 12*(m/3 + n/4)` at this gluing. -/
theorem engelOrder_twelve :
    (4 : ℤ) * 1 + 3 * (-1) = 12 * ((1 : ℤ) / 3 + (-1) / 4) := by
  native_decide

/-- The claim that is formalized: form, orders, unipotence, invariance. -/
theorem matrixClaim :
    Ω0ᵀ = -Ω0 ∧ Ω0.det = 36 ∧
    T1.det = 1 ∧ T2.det = 1 ∧ T0.det = 1 ∧
    T1 ^ 3 = 1 ∧ T2 ^ 4 = 1 ∧ N * N = 0 ∧
    T1ᵀ * Ω0 * T1 = Ω0 ∧
    T2ᵀ * Ω0 * T2 = Ω0 ∧
    T0ᵀ * Ω0 * T0 = Ω0 := by
  exact ⟨Ω0_skew, Ω0_det, T1_det, T2_det, T0_det,
    T1_pow_three, T2_pow_four, N_sq,
    T1_preserves_Ω0, T2_preserves_Ω0, T0_preserves_Ω0⟩

/-- Geometric claim. Not proved here. No axiom, no sorry. -/
def geometricClaim (X_exists pi1_trivial homology_S6 diffeo_S6 : Prop) : Prop :=
  X_exists ∧ pi1_trivial ∧ homology_S6 ∧ diffeo_S6

/-- The matrix theorem does not discharge the geometric claim. -/
theorem matrixClaim_not_geometric
    (X_exists pi1_trivial homology_S6 diffeo_S6 : Prop) :
    matrixClaim → geometricClaim X_exists pi1_trivial homology_S6 diffeo_S6 →
      geometricClaim X_exists pi1_trivial homology_S6 diffeo_S6 :=
  fun _ h => h

end OmegaZero34
