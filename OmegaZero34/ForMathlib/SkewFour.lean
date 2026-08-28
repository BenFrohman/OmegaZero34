/-
Copyright (c) 2026 Benjamin Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Frohman
-/
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Data.Matrix.Mul
import Mathlib.Tactic

/-!
# Rank-4 skew-symmetric matrices, 6-parameter form

A general \(4\times 4\) skew matrix over a commutative ring is determined
by six coordinates \((a,b,c,d,e,f)\). No monodromy representation is used.

**Upstream target:** `Mathlib.LinearAlgebra.Matrix.Skew.Four` (or a
section of `Mathlib.LinearAlgebra.Matrix.BilinearForm`).
-/

set_option autoImplicit false

open Matrix

namespace Matrix

/-- The general \(4\times 4\) skew-symmetric matrix with independent
upper-triangle entries \((a,b,c,d,e,f)\). -/
def skewFour {R : Type*} [CommRing R] (a b c d e f : R) : Matrix (Fin 4) (Fin 4) R :=
  !![ 0,  a,  b,  c;
     -a,  0,  d,  e;
     -b, -d,  0,  f;
     -c, -e, -f,  0]

lemma skewFour_transpose {R : Type*} [CommRing R] (a b c d e f : R) :
    (skewFour a b c d e f)ᵀ = -(skewFour a b c d e f) := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [skewFour, Matrix.neg_apply]

lemma skewFour_apply_01 {R : Type*} [CommRing R] (a b c d e f : R) :
    skewFour a b c d e f 0 1 = a := by simp [skewFour]
lemma skewFour_apply_02 {R : Type*} [CommRing R] (a b c d e f : R) :
    skewFour a b c d e f 0 2 = b := by simp [skewFour]
lemma skewFour_apply_03 {R : Type*} [CommRing R] (a b c d e f : R) :
    skewFour a b c d e f 0 3 = c := by simp [skewFour]
lemma skewFour_apply_12 {R : Type*} [CommRing R] (a b c d e f : R) :
    skewFour a b c d e f 1 2 = d := by simp [skewFour]
lemma skewFour_apply_13 {R : Type*} [CommRing R] (a b c d e f : R) :
    skewFour a b c d e f 1 3 = e := by simp [skewFour]
lemma skewFour_apply_23 {R : Type*} [CommRing R] (a b c d e f : R) :
    skewFour a b c d e f 2 3 = f := by simp [skewFour]

lemma skewFour_injective {R : Type*} [CommRing R]
    (a b c d e f a' b' c' d' e' f' : R) :
    skewFour a b c d e f = skewFour a' b' c' d' e' f' ↔
      a = a' ∧ b = b' ∧ c = c' ∧ d = d' ∧ e = e' ∧ f = f' := by
  constructor
  · intro h
    refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩
    · simpa [skewFour] using congr_fun (congr_fun h 0) 1
    · simpa [skewFour] using congr_fun (congr_fun h 0) 2
    · simpa [skewFour] using congr_fun (congr_fun h 0) 3
    · simpa [skewFour] using congr_fun (congr_fun h 1) 2
    · simpa [skewFour] using congr_fun (congr_fun h 1) 3
    · simpa [skewFour] using congr_fun (congr_fun h 2) 3
  · rintro ⟨rfl, rfl, rfl, rfl, rfl, rfl⟩
    rfl

lemma skewFour_smul {R : Type*} [CommRing R] (r a b c d e f : R) :
    r • skewFour a b c d e f =
      skewFour (r * a) (r * b) (r * c) (r * d) (r * e) (r * f) := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [skewFour, Matrix.smul_apply]

/-- Pfaffian of a \(4\times 4\) skew matrix in the six-parameter coordinates.
This is a scalar invariant of the form, not the form. -/
def pfaffianFour {R : Type*} [CommRing R] (a b c d e f : R) : R :=
  a * f - b * e + c * d

/-- Reconstruct a skew \(4\times 4\) matrix from its six independent entries. -/
lemma eq_skewFour_of_transpose_eq_neg {S : Type*} [CommRing S] [CharZero S]
    [NoZeroDivisors S] (Ω : Matrix (Fin 4) (Fin 4) S) (h : transpose Ω = -Ω) :
    Ω = skewFour (Ω 0 1) (Ω 0 2) (Ω 0 3) (Ω 1 2) (Ω 1 3) (Ω 2 3) := by
  have hswap (i j : Fin 4) : Ω j i = -Ω i j := by
    have hij := congr_fun (congr_fun h i) j
    simpa [transpose_apply, Matrix.neg_apply] using hij
  have hdiag (i : Fin 4) : Ω i i = 0 := by
    have hi := hswap i i
    have h2 : (2 : S) * Ω i i = 0 := by
      have := congrArg (fun t => t + Ω i i) hi
      simpa [two_mul] using this
    exact (mul_eq_zero.mp h2).resolve_left two_ne_zero
  ext i j
  fin_cases i <;> fin_cases j
  · simp [skewFour]; exact hdiag 0
  · simp [skewFour]
  · simp [skewFour]
  · simp [skewFour]
  · simp [skewFour]; exact hswap 0 1
  · simp [skewFour]; exact hdiag 1
  · simp [skewFour]
  · simp [skewFour]
  · simp [skewFour]; exact hswap 0 2
  · simp [skewFour]; exact hswap 1 2
  · simp [skewFour]; exact hdiag 2
  · simp [skewFour]
  · simp [skewFour]; exact hswap 0 3
  · simp [skewFour]; exact hswap 1 3
  · simp [skewFour]; exact hswap 2 3
  · simp [skewFour]; exact hdiag 3

end Matrix
