/-
Copyright (c) 2026 Benjamin Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Frohman
-/
import OmegaZero34.ForMathlib.MulFinFour
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Tactic

/-!
# Source matrices of the (3,4,∞) representation

Integer matrices \(T_1,T_2,T_0,N\) as in Alpöge’s note `alpo.ge/s6.pdf`,
basis \((\gamma,u,w,\delta)\) of \(V=\mathbb{Z}^4\).

This file is finite matrix algebra only. It does not treat compactification
or \(X\simeq S^6\).
-/

set_option autoImplicit false

open Matrix

namespace OmegaZero34

/-- The ambient lattice \(V=\mathbb{Z}^4\). -/
abbrev V := Fin 4 → ℤ

/-- Monodromy matrix \(T_1\) of order 3. -/
def T1 : Matrix (Fin 4) (Fin 4) ℤ :=
  !![1, 0, -6, 2;
    0, -1, 1, 1;
    0, -1, 0, 1;
    0, 0, 0, 1]

/-- Monodromy matrix \(T_2\) of order 4. -/
def T2 : Matrix (Fin 4) (Fin 4) ℤ :=
  !![1, 6, 0, -3;
    0, 0, -1, 1;
    0, 1, 0, 0;
    0, 0, 0, 1]

/-- Unipotent cusp element \(T_0=(T_1 T_2)^{-1}\), given explicitly. -/
def T0 : Matrix (Fin 4) (Fin 4) ℤ :=
  !![1, 0, 0, 1;
    0, 1, -1, 0;
    0, 0, 1, 0;
    0, 0, 0, 1]

/-- Nilpotent logarithm \(N=T_0-I\). -/
def N : Matrix (Fin 4) (Fin 4) ℤ :=
  !![0, 0, 0, 1;
    0, 0, -1, 0;
    0, 0, 0, 0;
    0, 0, 0, 0]

/-- The same matrices over an arbitrary commutative ring (for the parameter chase). -/
def T1R {R : Type*} [CommRing R] : Matrix (Fin 4) (Fin 4) R :=
  !![1, 0, -6, 2;
    0, -1, 1, 1;
    0, -1, 0, 1;
    0, 0, 0, 1]

def T2R {R : Type*} [CommRing R] : Matrix (Fin 4) (Fin 4) R :=
  !![1, 6, 0, -3;
    0, 0, -1, 1;
    0, 1, 0, 0;
    0, 0, 0, 1]

def T0R {R : Type*} [CommRing R] : Matrix (Fin 4) (Fin 4) R :=
  !![1, 0, 0, 1;
    0, 1, -1, 0;
    0, 0, 1, 0;
    0, 0, 0, 1]

def NR {R : Type*} [CommRing R] : Matrix (Fin 4) (Fin 4) R :=
  !![0, 0, 0, 1;
    0, 0, -1, 0;
    0, 0, 0, 0;
    0, 0, 0, 0]

lemma T1_eq_T1R : T1 = T1R := rfl
lemma T2_eq_T2R : T2 = T2R := rfl
lemma T0_eq_T0R : T0 = T0R := rfl
lemma N_eq_NR : N = NR := rfl

lemma T1_det : T1.det = 1 := by native_decide
lemma T2_det : T2.det = 1 := by native_decide
lemma T0_det : T0.det = 1 := by native_decide

lemma T1T2_explicit :
    T1 * T2 = !![1, 0, 0, -1; 0, 1, 1, 0; 0, 0, 1, 0; 0, 0, 0, 1] := by
  native_decide

lemma T0_mul_T1T2 : T0 * (T1 * T2) = 1 := by native_decide
lemma T1T2_mul_T0 : (T1 * T2) * T0 = 1 := by native_decide

lemma T0_eq_N_add_one : T0 = N + 1 := by native_decide
lemma N_eq_T0_sub_one : N = T0 - 1 := by native_decide

lemma T1_pow_three : T1 ^ 3 = 1 := by native_decide
lemma T1_ne_one : T1 ≠ 1 := by native_decide
lemma T1_pow_two_ne_one : T1 ^ 2 ≠ 1 := by native_decide

lemma T2_pow_four : T2 ^ 4 = 1 := by native_decide
lemma T2_ne_one : T2 ≠ 1 := by native_decide
lemma T2_pow_two_ne_one : T2 ^ 2 ≠ 1 := by native_decide
lemma T2_pow_three_ne_one : T2 ^ 3 ≠ 1 := by native_decide

lemma N_sq : N * N = 0 := by native_decide
lemma N_ne_zero : N ≠ 0 := by native_decide

lemma N_00 : N 0 0 = 0 := by simp [N]
lemma N_01 : N 0 1 = 0 := by simp [N]
lemma N_02 : N 0 2 = 0 := by simp [N]
lemma N_03 : N 0 3 = 1 := by simp [N]
lemma N_10 : N 1 0 = 0 := by simp [N]
lemma N_11 : N 1 1 = 0 := by simp [N]
lemma N_12 : N 1 2 = -1 := by simp [N]
lemma N_13 : N 1 3 = 0 := by simp [N]
lemma N_20 : N 2 0 = 0 := by simp [N]
lemma N_21 : N 2 1 = 0 := by simp [N]
lemma N_22 : N 2 2 = 0 := by simp [N]
lemma N_23 : N 2 3 = 0 := by simp [N]
lemma N_30 : N 3 0 = 0 := by simp [N]
lemma N_31 : N 3 1 = 0 := by simp [N]
lemma N_32 : N 3 2 = 0 := by simp [N]
lemma N_33 : N 3 3 = 0 := by simp [N]

/-- Action of \(N\) on coordinates: \(N(x_0,x_1,x_2,x_3)=(x_3,-x_2,0,0)\). -/
lemma N_mulVec_zero (x : Fin 4 → ℤ) : (N *ᵥ x) 0 = x 3 := by
  unfold mulVec
  rw [dotProduct, Fin.sum_univ_four, N_00, N_01, N_02, N_03]
  simp

lemma N_mulVec_one (x : Fin 4 → ℤ) : (N *ᵥ x) 1 = -x 2 := by
  unfold mulVec
  rw [dotProduct, Fin.sum_univ_four, N_10, N_11, N_12, N_13]
  simp

lemma N_mulVec_two (x : Fin 4 → ℤ) : (N *ᵥ x) 2 = 0 := by
  unfold mulVec
  rw [dotProduct, Fin.sum_univ_four, N_20, N_21, N_22, N_23]
  simp

lemma N_mulVec_three (x : Fin 4 → ℤ) : (N *ᵥ x) 3 = 0 := by
  unfold mulVec
  rw [dotProduct, Fin.sum_univ_four, N_30, N_31, N_32, N_33]
  simp

lemma N_gamma : N.mulVec ![1, 0, 0, 0] = 0 := by native_decide
lemma N_u : N.mulVec ![0, 1, 0, 0] = 0 := by native_decide
lemma N_w : N.mulVec ![0, 0, 1, 0] = ![0, -1, 0, 0] := by native_decide
lemma N_delta : N.mulVec ![0, 0, 0, 1] = ![1, 0, 0, 0] := by native_decide

end OmegaZero34
