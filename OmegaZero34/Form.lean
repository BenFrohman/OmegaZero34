/-
Copyright (c) 2026 Benjamin Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Frohman
-/
import OmegaZero34.Matrices
import OmegaZero34.ForMathlib.SkewFour
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse

/-!
# The explicit form Ω₀

Primitive integral generator of the space of \(T_1,T_2\)-invariant
alternating forms on \(\mathbb{Z}^4\):
\[
\Omega_0=\begin{pmatrix}0&0&0&1\\0&0&6&0\\0&-6&0&0\\-1&0&0&0\end{pmatrix}.
\]
Pairings in the basis \((\gamma,u,w,\delta)\): \(\omega_0(\gamma,\delta)=1\),
\(\omega_0(u,w)=6\).
-/

set_option autoImplicit false

open Matrix

namespace OmegaZero34

/-- Primitive integral generator of the tether restricted to this lattice.

A Frohmanian tether restricts here to `λ • Ω0`. This matrix is that form,
not the cusp logarithm `N` and not the Pfaffian `Pf(Ω0) = 6`.
-/
def Ω0 : Matrix (Fin 4) (Fin 4) ℤ :=
  !![ 0,  0,  0,  1;
      0,  0,  6,  0;
      0, -6,  0,  0;
     -1,  0,  0,  0]

def Ω0R {R : Type*} [CommRing R] : Matrix (Fin 4) (Fin 4) R :=
  !![ 0,  0,  0,  1;
      0,  0,  6,  0;
      0, -6,  0,  0;
     -1,  0,  0,  0]

lemma Ω0_eq_Ω0R : Ω0 = Ω0R := rfl

/-- Paper name for the generic 4×4 skew matrix (`Matrix.skewFour`, ForMathlib). -/
abbrev ofParams {R : Type*} [CommRing R] := skewFour (R := R)

lemma Ω0_eq_ofParams : Ω0 = ofParams (0 : ℤ) 0 1 6 0 0 := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Ω0, ofParams, skewFour]

lemma Ω0R_eq_ofParams {R : Type*} [CommRing R] :
    Ω0R (R := R) = ofParams (0 : R) 0 1 6 0 0 := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Ω0R, ofParams, skewFour]

lemma ofParams_skew {R : Type*} [CommRing R] (a b c d e f : R) :
    (ofParams a b c d e f)ᵀ = -(ofParams a b c d e f) :=
  skewFour_transpose a b c d e f

lemma Ω0_skew : Ω0ᵀ = -Ω0 := by native_decide

/-- Paper name for `Matrix.pfaffianFour`. `Pf(Ω0) = 6` is a scalar of the form,
not the tether. -/
abbrev pfaffian4 {R : Type*} [CommRing R] := pfaffianFour (R := R)

lemma Ω0_pfaffian : pfaffian4 (0 : ℤ) 0 1 6 0 0 = 6 := by native_decide

lemma Ω0_det : Ω0.det = 36 := by native_decide

lemma Ω0_det_ne_zero : Ω0.det ≠ 0 := by
  rw [Ω0_det]
  native_decide

lemma T1_preserves_Ω0 : T1ᵀ * Ω0 * T1 = Ω0 := by native_decide
lemma T2_preserves_Ω0 : T2ᵀ * Ω0 * T2 = Ω0 := by native_decide
lemma T0_preserves_Ω0 : T0ᵀ * Ω0 * T0 = Ω0 := by native_decide

/-- Pairings of basis vectors. Indices: 0=γ, 1=u, 2=w, 3=δ. -/
lemma Ω0_gamma_delta : Ω0 0 3 = 1 := rfl
lemma Ω0_u_w : Ω0 1 2 = 6 := rfl
lemma Ω0_gamma_u : Ω0 0 1 = 0 := rfl
lemma Ω0_gamma_w : Ω0 0 2 = 0 := rfl
lemma Ω0_u_delta : Ω0 1 3 = 0 := rfl
lemma Ω0_w_delta : Ω0 2 3 = 0 := rfl

lemma ofParams_apply_01 {R : Type*} [CommRing R] (a b c d e f : R) :
    ofParams a b c d e f 0 1 = a := skewFour_apply_01 a b c d e f
lemma ofParams_apply_02 {R : Type*} [CommRing R] (a b c d e f : R) :
    ofParams a b c d e f 0 2 = b := skewFour_apply_02 a b c d e f
lemma ofParams_apply_03 {R : Type*} [CommRing R] (a b c d e f : R) :
    ofParams a b c d e f 0 3 = c := skewFour_apply_03 a b c d e f
lemma ofParams_apply_12 {R : Type*} [CommRing R] (a b c d e f : R) :
    ofParams a b c d e f 1 2 = d := skewFour_apply_12 a b c d e f
lemma ofParams_apply_13 {R : Type*} [CommRing R] (a b c d e f : R) :
    ofParams a b c d e f 1 3 = e := skewFour_apply_13 a b c d e f
lemma ofParams_apply_23 {R : Type*} [CommRing R] (a b c d e f : R) :
    ofParams a b c d e f 2 3 = f := skewFour_apply_23 a b c d e f

lemma ofParams_injective {R : Type*} [CommRing R]
    (a b c d e f a' b' c' d' e' f' : R) :
    ofParams a b c d e f = ofParams a' b' c' d' e' f' ↔
      a = a' ∧ b = b' ∧ c = c' ∧ d = d' ∧ e = e' ∧ f = f' :=
  skewFour_injective a b c d e f a' b' c' d' e' f'

lemma ofParams_smul {R : Type*} [CommRing R] (r a b c d e f : R) :
    r • ofParams a b c d e f =
      ofParams (r * a) (r * b) (r * c) (r * d) (r * e) (r * f) :=
  skewFour_smul r a b c d e f

lemma ofParams_c_six {R : Type*} [CommRing R] (c : R) :
    ofParams (0 : R) 0 c (6 * c) 0 0 = c • Ω0R := by
  rw [Ω0R_eq_ofParams, ofParams_smul]
  simp only [mul_zero, mul_one, mul_comm]

end OmegaZero34
