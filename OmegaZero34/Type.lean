/-
Copyright (c) 2026 Benjamin Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Frohman
-/
import OmegaZero34.Form
import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Matrix.Mul

/-!
# Elementary-divisor type (1,6)

In the ordered basis `(γ, δ, u, w)` the form is already
the block sum of `(0,1; -1,0)` and `(0,6; -6,0)`.
Hence `ω₀` is not unimodular (not type `(1,1)`).

`Pf(Ω0) = 6` is the integer that records this type. It is a scalar
invariant of the tether form, not the tether.
-/

set_option autoImplicit false

open Matrix

namespace OmegaZero34

/-- Change-of-basis matrix sending the ordered basis \((\gamma,\delta,u,w)\)
to the source basis \((\gamma,u,w,\delta)\). Columns are the new basis
vectors in old coordinates. -/
def P : Matrix (Fin 4) (Fin 4) ℤ :=
  !![1, 0, 0, 0;
     0, 0, 1, 0;
     0, 0, 0, 1;
     0, 1, 0, 0]

/-- Standard type-\((1,6)\) block form. -/
def J16 : Matrix (Fin 4) (Fin 4) ℤ :=
  !![ 0, 1, 0, 0;
     -1, 0, 0, 0;
      0, 0, 0, 6;
      0, 0, -6, 0]

lemma P_det : P.det = 1 := by native_decide

lemma type_normal_form : Pᵀ * Ω0 * P = J16 := by native_decide

lemma J16_det : J16.det = 36 := by native_decide

/-- The form is not unimodular: \(\det\Omega_0\neq\pm 1\). -/
lemma not_unimodular : Ω0.det ≠ 1 ∧ Ω0.det ≠ -1 := by
  rw [Ω0_det]
  constructor <;> native_decide

/-- Reduction modulo \(2\): the \((u,w)\)-plane is in the kernel. -/
lemma Ω0_mod_two :
    (Ω0.map (Int.cast : ℤ → ZMod 2)) =
      !![0, 0, 0, 1;
         0, 0, 0, 0;
         0, 0, 0, 0;
         1, 0, 0, 0] := by
  native_decide

/-- Reduction modulo \(3\): the \((u,w)\)-plane is in the kernel. -/
lemma Ω0_mod_three :
    (Ω0.map (Int.cast : ℤ → ZMod 3)) =
      !![0, 0, 0, 1;
         0, 0, 0, 0;
         0, 0, 0, 0;
         2, 0, 0, 0] := by
  native_decide

lemma ker_mod_two (x : Fin 4 → ZMod 2)
    (h : (Ω0.map (Int.cast : ℤ → ZMod 2)) *ᵥ x = 0) :
    x 0 = 0 ∧ x 3 = 0 := by
  have hx0 := congr_fun h 0
  have hx3 := congr_fun h 3
  unfold mulVec at hx0 hx3
  rw [dotProduct, Fin.sum_univ_four] at hx0 hx3
  simp [Ω0] at hx0 hx3
  exact ⟨hx3, hx0⟩

lemma ker_mod_three (x : Fin 4 → ZMod 3)
    (h : (Ω0.map (Int.cast : ℤ → ZMod 3)) *ᵥ x = 0) :
    x 0 = 0 ∧ x 3 = 0 := by
  have hx0 := congr_fun h 0
  have hx3 := congr_fun h 3
  unfold mulVec at hx0 hx3
  rw [dotProduct, Fin.sum_univ_four] at hx0 hx3
  simp [Ω0] at hx0 hx3
  -- hx0 : x 3 = 0; hx3 : -x 0 = 0
  exact ⟨hx3, hx0⟩

end OmegaZero34
