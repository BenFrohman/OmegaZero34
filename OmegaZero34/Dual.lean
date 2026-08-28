/-
Copyright (c) 2026 Benjamin Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Frohman
-/
import OmegaZero34.Form
import Mathlib.Data.Rat.Defs

/-!
# Dual action, fixed vectors, and the dual form

\(A_j=(T_j^{-1})^T\) on \(\Lambda=V^*\). The source vectors \(\varepsilon,\varepsilon'\)
are fixed. The dual pairing is \(\Omega_0^{-1}\) over \(\mathbb{Q}\); its primitive
integral representative in the dual ray is \(\mathrm{adj}(\Omega_0)\).
-/

set_option autoImplicit false

open Matrix

namespace OmegaZero34

/-- Dual of \(T_1\): \(A_1=(T_1^{-1})^T=(T_1^2)^T\). -/
def A1 : Matrix (Fin 4) (Fin 4) ℤ :=
  !![1,  0,  0, 0;
     6,  0,  1, 0;
    -6, -1, -1, 0;
    -2,  1,  0, 1]

/-- Dual of \(T_2\): \(A_2=(T_2^{-1})^T=(T_2^3)^T\). -/
def A2 : Matrix (Fin 4) (Fin 4) ℤ :=
  !![1,  0,  0, 0;
     0,  0, -1, 0;
    -6,  1,  0, 0;
     3,  0,  1, 1]

/-- Dual of \(T_0\): \(A_0=(T_0^{-1})^T=(T_1 T_2)^T\). -/
def A0 : Matrix (Fin 4) (Fin 4) ℤ :=
  !![ 1, 0, 0, 0;
      0, 1, 0, 0;
      0, 1, 1, 0;
     -1, 0, 0, 1]

lemma A1_eq_T1_pow : A1 = (T1 ^ 2)ᵀ := by native_decide
lemma A2_eq_T2_pow : A2 = (T2 ^ 3)ᵀ := by native_decide
lemma A0_eq_T1T2_transpose : A0 = (T1 * T2)ᵀ := by native_decide

lemma A1_mul_T1_transpose : A1 * T1ᵀ = 1 := by native_decide
lemma A2_mul_T2_transpose : A2 * T2ᵀ = 1 := by native_decide
lemma A0_mul_T0_transpose : A0 * T0ᵀ = 1 := by native_decide

/-- Source vector \(\varepsilon=\hat\gamma+2\hat u-4\hat w\). -/
def ε : Fin 4 → ℤ := ![1, 2, -4, 0]

/-- Source vector \(\varepsilon'=\hat\gamma+3\hat u-3\hat w\). -/
def ε' : Fin 4 → ℤ := ![1, 3, -3, 0]

lemma A1_fixes_ε : A1.mulVec ε = ε := by native_decide
lemma A2_fixes_ε' : A2.mulVec ε' = ε' := by native_decide

/-- Classical adjoint of \(\Omega_0\). Equals \(36\cdot\Omega_0^{-1}\). -/
def adjΩ0 : Matrix (Fin 4) (Fin 4) ℤ :=
  !![ 0,  0,  0, -36;
      0,  0, -6,   0;
      0,  6,  0,   0;
     36,  0,  0,   0]

lemma Ω0_mul_adj : Ω0 * adjΩ0 = (36 : ℤ) • (1 : Matrix (Fin 4) (Fin 4) ℤ) := by
  native_decide

lemma adj_mul_Ω0 : adjΩ0 * Ω0 = (36 : ℤ) • (1 : Matrix (Fin 4) (Fin 4) ℤ) := by
  native_decide

lemma adjΩ0_det : adjΩ0.det = 46656 := by native_decide

/-- Primitive integral generator of the dual ray (content \(6\)). -/
def Ω0dualPrim : Matrix (Fin 4) (Fin 4) ℤ :=
  !![0,  0,  0, -6;
     0,  0, -1,  0;
     0,  1,  0,  0;
     6,  0,  0,  0]

lemma adjΩ0_eq_six_dual : adjΩ0 = (6 : ℤ) • Ω0dualPrim := by native_decide

lemma Ω0dualPrim_det : Ω0dualPrim.det = 36 := by native_decide

lemma A1_preserves_adj : A1ᵀ * adjΩ0 * A1 = adjΩ0 := by native_decide
lemma A2_preserves_adj : A2ᵀ * adjΩ0 * A2 = adjΩ0 := by native_decide
lemma A0_preserves_adj : A0ᵀ * adjΩ0 * A0 = adjΩ0 := by native_decide

lemma A1_preserves_dualPrim : A1ᵀ * Ω0dualPrim * A1 = Ω0dualPrim := by native_decide
lemma A2_preserves_dualPrim : A2ᵀ * Ω0dualPrim * A2 = Ω0dualPrim := by native_decide
lemma A0_preserves_dualPrim : A0ᵀ * Ω0dualPrim * A0 = Ω0dualPrim := by native_decide

/-- Inverse form over \(\mathbb{Q}\). -/
def Ω0inv : Matrix (Fin 4) (Fin 4) ℚ :=
  !![0, 0, 0, -1;
     0, 0, (-1 : ℚ) / 6, 0;
     0, (1 : ℚ) / 6, 0, 0;
     1, 0, 0, 0]

lemma Ω0Q_mul_inv :
    (Ω0.map (Int.cast : ℤ → ℚ)) * Ω0inv = 1 := by
  native_decide

lemma Ω0inv_mul_Ω0Q :
    Ω0inv * (Ω0.map (Int.cast : ℤ → ℚ)) = 1 := by
  native_decide

lemma adj_eq_36_inv :
    adjΩ0.map (Int.cast : ℤ → ℚ) = (36 : ℚ) • Ω0inv := by
  native_decide

end OmegaZero34
