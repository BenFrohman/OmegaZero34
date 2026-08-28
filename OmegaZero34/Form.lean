/-
Copyright (c) 2026 Benjamin Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import OmegaZero34.Matrices
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

/-- The lattice-level tether form.

This matrix *is* the tether on the \((3,4,\infty)\) representation: the
unique (up to scalar) monodromy-invariant alternating pairing. It is not
the unipotent logarithm \(N\), and it is not the Pfaffian scalar
\(\mathrm{Pf}(\Omega_0)=6\). Those are derived invariants of this form.
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

/-- General element of the 6-dimensional space of \(4\times 4\) skew matrices. -/
def ofParams {R : Type*} [CommRing R] (a b c d e f : R) : Matrix (Fin 4) (Fin 4) R :=
  !![ 0,  a,  b,  c;
     -a,  0,  d,  e;
     -b, -d,  0,  f;
     -c, -e, -f,  0]

lemma Ω0_eq_ofParams : Ω0 = ofParams (0 : ℤ) 0 1 6 0 0 := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Ω0, ofParams]

lemma Ω0R_eq_ofParams {R : Type*} [CommRing R] :
    Ω0R (R := R) = ofParams (0 : R) 0 1 6 0 0 := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Ω0R, ofParams]

lemma ofParams_skew {R : Type*} [CommRing R] (a b c d e f : R) :
    (ofParams a b c d e f)ᵀ = -(ofParams a b c d e f) := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [ofParams, Matrix.neg_apply]

lemma Ω0_skew : Ω0ᵀ = -Ω0 := by native_decide

/-- Pfaffian of a 4×4 skew matrix in the coordinates \((a,b,c,d,e,f)\). -/
def pfaffian4 {R : Type*} [CommRing R] (a b c d e f : R) : R := a * f - b * e + c * d

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
    ofParams a b c d e f 0 1 = a := by simp [ofParams]
lemma ofParams_apply_02 {R : Type*} [CommRing R] (a b c d e f : R) :
    ofParams a b c d e f 0 2 = b := by simp [ofParams]
lemma ofParams_apply_03 {R : Type*} [CommRing R] (a b c d e f : R) :
    ofParams a b c d e f 0 3 = c := by simp [ofParams]
lemma ofParams_apply_12 {R : Type*} [CommRing R] (a b c d e f : R) :
    ofParams a b c d e f 1 2 = d := by simp [ofParams]
lemma ofParams_apply_13 {R : Type*} [CommRing R] (a b c d e f : R) :
    ofParams a b c d e f 1 3 = e := by simp [ofParams]
lemma ofParams_apply_23 {R : Type*} [CommRing R] (a b c d e f : R) :
    ofParams a b c d e f 2 3 = f := by simp [ofParams]

lemma ofParams_injective {R : Type*} [CommRing R] (a b c d e f a' b' c' d' e' f' : R) :
    ofParams a b c d e f = ofParams a' b' c' d' e' f' ↔
      a = a' ∧ b = b' ∧ c = c' ∧ d = d' ∧ e = e' ∧ f = f' := by
  constructor
  · intro h
    refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩
    · simpa [ofParams] using congr_fun (congr_fun h 0) 1
    · simpa [ofParams] using congr_fun (congr_fun h 0) 2
    · simpa [ofParams] using congr_fun (congr_fun h 0) 3
    · simpa [ofParams] using congr_fun (congr_fun h 1) 2
    · simpa [ofParams] using congr_fun (congr_fun h 1) 3
    · simpa [ofParams] using congr_fun (congr_fun h 2) 3
  · rintro ⟨rfl, rfl, rfl, rfl, rfl, rfl⟩
    rfl

lemma ofParams_smul {R : Type*} [CommRing R] (r a b c d e f : R) :
    r • ofParams a b c d e f = ofParams (r * a) (r * b) (r * c) (r * d) (r * e) (r * f) := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [ofParams, Matrix.smul_apply]

lemma ofParams_c_six {R : Type*} [CommRing R] (c : R) :
    ofParams (0 : R) 0 c (6 * c) 0 0 = c • Ω0R := by
  rw [Ω0R_eq_ofParams, ofParams_smul]
  simp only [mul_zero, mul_one, mul_comm]

end OmegaZero34
