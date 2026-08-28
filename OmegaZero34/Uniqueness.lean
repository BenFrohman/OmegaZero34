/-
Copyright (c) 2026 Benjamin Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import OmegaZero34.Form
import Mathlib.Data.Matrix.Mul

/-!
# Uniqueness of the invariant form

Equation-by-equation solution of the twelve residual pairings.
On this lattice the tether is the form `Ω0`, not the nilpotent `N`
and not the Pfaffian.
-/

set_option autoImplicit false
set_option maxHeartbeats 800000
set_option linter.unusedSimpArgs false

open Matrix

namespace OmegaZero34

variable {R : Type*} [CommRing R]

/-- Triple product entries. -/
lemma mul3_apply (A B C : Matrix (Fin 4) (Fin 4) R) (i j : Fin 4) :
    (A * B * C) i j =
      (A i 0 * B 0 0 + A i 1 * B 1 0 + A i 2 * B 2 0 + A i 3 * B 3 0) * C 0 j +
      (A i 0 * B 0 1 + A i 1 * B 1 1 + A i 2 * B 2 1 + A i 3 * B 3 1) * C 1 j +
      (A i 0 * B 0 2 + A i 1 * B 1 2 + A i 2 * B 2 2 + A i 3 * B 3 2) * C 2 j +
      (A i 0 * B 0 3 + A i 1 * B 1 3 + A i 2 * B 2 3 + A i 3 * B 3 3) * C 3 j := by
  simp [mul_apply, Fin.sum_univ_four]

/-- `T₁` conjugation on the six-parameter family. -/
lemma T1_conj_ofParams (a b c d e f : R) :
    transpose (T1R (R := R)) * ofParams a b c d e f * T1R =
      ofParams (-a - b) a (a + b + c) (-6 * a - 6 * b + d)
        (2 * a + 2 * b - e - f) (-8 * a - 6 * b - 6 * c + d + e) := by
  ext i j
  rw [mul3_apply]
  fin_cases i <;> fin_cases j <;>
    simp [T1R, ofParams, transpose_apply] <;> ring

/-- `T₂` conjugation on the six-parameter family. -/
lemma T2_conj_ofParams (a b c d e f : R) :
    transpose (T2R (R := R)) * ofParams a b c d e f * T2R =
      ofParams b (-a) (a + c) (-6 * a + d)
        (6 * a + 3 * b + 6 * c - d + f) (-3 * a - e) := by
  ext i j
  rw [mul3_apply]
  fin_cases i <;> fin_cases j <;>
    simp [T2R, ofParams, transpose_apply] <;> ring

theorem invariant_params (a b c d e f : ℚ)
    (h1 : transpose T1R * ofParams a b c d e f * T1R = ofParams a b c d e f)
    (h2 : transpose T2R * ofParams a b c d e f * T2R = ofParams a b c d e f) :
    a = 0 ∧ b = 0 ∧ e = 0 ∧ f = 0 ∧ d = 6 * c := by
  have h2' := (ofParams_injective _ _ _ _ _ _ _ _ _ _ _ _).mp <|
    (T2_conj_ofParams a b c d e f).symm.trans h2
  have h1' := (ofParams_injective _ _ _ _ _ _ _ _ _ _ _ _).mp <|
    (T1_conj_ofParams a b c d e f).symm.trans h1
  obtain ⟨h2a, h2b, h2c, h2d, h2e, h2f⟩ := h2'
  obtain ⟨h1a, h1b, h1c, h1d, h1e, h1f⟩ := h1'
  refine ⟨?_, ?_, ?_, ?_, ?_⟩
  · linarith
  · linarith
  · linarith
  · linarith
  · linarith

theorem invariant_params_int (a b c d e f : ℤ)
    (h1 : transpose T1R * ofParams a b c d e f * T1R = ofParams a b c d e f)
    (h2 : transpose T2R * ofParams a b c d e f * T2R = ofParams a b c d e f) :
    a = 0 ∧ b = 0 ∧ e = 0 ∧ f = 0 ∧ d = 6 * c := by
  have h2' := (ofParams_injective _ _ _ _ _ _ _ _ _ _ _ _).mp <|
    (T2_conj_ofParams a b c d e f).symm.trans h2
  have h1' := (ofParams_injective _ _ _ _ _ _ _ _ _ _ _ _).mp <|
    (T1_conj_ofParams a b c d e f).symm.trans h1
  obtain ⟨h2a, h2b, h2c, h2d, h2e, h2f⟩ := h2'
  obtain ⟨h1a, h1b, h1c, h1d, h1e, h1f⟩ := h1'
  refine ⟨?_, ?_, ?_, ?_, ?_⟩
  · omega
  · omega
  · omega
  · omega
  · omega

theorem invariant_ofParams_eq_smul (a b c d e f : ℚ)
    (h1 : transpose T1R * ofParams a b c d e f * T1R = ofParams a b c d e f)
    (h2 : transpose T2R * ofParams a b c d e f * T2R = ofParams a b c d e f) :
    ofParams a b c d e f = c • Ω0R := by
  obtain ⟨ha, hb, he, hf, hd⟩ := invariant_params a b c d e f h1 h2
  subst ha; subst hb; subst he; subst hf
  rw [hd, ofParams_c_six]

theorem invariant_ofParams_eq_smul_int (a b c d e f : ℤ)
    (h1 : transpose T1R * ofParams a b c d e f * T1R = ofParams a b c d e f)
    (h2 : transpose T2R * ofParams a b c d e f * T2R = ofParams a b c d e f) :
    ofParams a b c d e f = c • Ω0R := by
  obtain ⟨ha, hb, he, hf, hd⟩ := invariant_params_int a b c d e f h1 h2
  subst ha; subst hb; subst he; subst hf
  rw [hd, ofParams_c_six]

lemma skew_eq_ofParams {S : Type*} [CommRing S] [CharZero S] [NoZeroDivisors S]
    (Ω : Matrix (Fin 4) (Fin 4) S) (h : transpose Ω = -Ω) :
    Ω = ofParams (Ω 0 1) (Ω 0 2) (Ω 0 3) (Ω 1 2) (Ω 1 3) (Ω 2 3) := by
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
  · simp [ofParams]; exact hdiag 0
  · simp [ofParams]
  · simp [ofParams]
  · simp [ofParams]
  · simp [ofParams]; exact hswap 0 1
  · simp [ofParams]; exact hdiag 1
  · simp [ofParams]
  · simp [ofParams]
  · simp [ofParams]; exact hswap 0 2
  · simp [ofParams]; exact hswap 1 2
  · simp [ofParams]; exact hdiag 2
  · simp [ofParams]
  · simp [ofParams]; exact hswap 0 3
  · simp [ofParams]; exact hswap 1 3
  · simp [ofParams]; exact hswap 2 3
  · simp [ofParams]; exact hdiag 3

/-- The tether on this lattice is this form: any invariant rational skew
matrix is a scalar multiple of `Ω0`. -/
theorem uniqueness_over_Q (Ψ : Matrix (Fin 4) (Fin 4) ℚ)
    (hsk : transpose Ψ = -Ψ)
    (h1 : transpose T1R * Ψ * T1R = Ψ)
    (h2 : transpose T2R * Ψ * T2R = Ψ) :
    Ψ = Ψ 0 3 • Ω0R := by
  have hΩ : Ψ = ofParams (Ψ 0 1) (Ψ 0 2) (Ψ 0 3) (Ψ 1 2) (Ψ 1 3) (Ψ 2 3) :=
    skew_eq_ofParams Ψ hsk
  rw [hΩ] at h1 h2 ⊢
  exact invariant_ofParams_eq_smul _ _ _ _ _ _ h1 h2

theorem uniqueness_scalar_unique (Ψ : Matrix (Fin 4) (Fin 4) ℚ)
    (t u : ℚ) (ht : Ψ = t • Ω0R) (hu : Ψ = u • Ω0R) :
    t = u := by
  have h := hu.symm.trans ht
  have : (u • Ω0R) 0 3 = (t • Ω0R) 0 3 := congr_fun (congr_fun h 0) 3
  simp [Ω0R, Matrix.smul_apply] at this
  exact this.symm

theorem uniqueness_integral (Ψ : Matrix (Fin 4) (Fin 4) ℤ)
    (hsk : transpose Ψ = -Ψ)
    (h1 : transpose T1 * Ψ * T1 = Ψ)
    (h2 : transpose T2 * Ψ * T2 = Ψ) :
    Ψ = Ψ 0 3 • Ω0 := by
  have hΩ : Ψ = ofParams (Ψ 0 1) (Ψ 0 2) (Ψ 0 3) (Ψ 1 2) (Ψ 1 3) (Ψ 2 3) :=
    skew_eq_ofParams Ψ hsk
  have h1' : transpose T1R * ofParams (Ψ 0 1) (Ψ 0 2) (Ψ 0 3) (Ψ 1 2) (Ψ 1 3) (Ψ 2 3) * T1R =
      ofParams (Ψ 0 1) (Ψ 0 2) (Ψ 0 3) (Ψ 1 2) (Ψ 1 3) (Ψ 2 3) := by
    rw [← hΩ, ← T1_eq_T1R]; exact h1
  have h2' : transpose T2R * ofParams (Ψ 0 1) (Ψ 0 2) (Ψ 0 3) (Ψ 1 2) (Ψ 1 3) (Ψ 2 3) * T2R =
      ofParams (Ψ 0 1) (Ψ 0 2) (Ψ 0 3) (Ψ 1 2) (Ψ 1 3) (Ψ 2 3) := by
    rw [← hΩ, ← T2_eq_T2R]; exact h2
  have hsmul := invariant_ofParams_eq_smul_int _ _ _ _ _ _ h1' h2'
  calc Ψ = ofParams (Ψ 0 1) (Ψ 0 2) (Ψ 0 3) (Ψ 1 2) (Ψ 1 3) (Ψ 2 3) := hΩ
    _ = Ψ 0 3 • Ω0R := hsmul
    _ = Ψ 0 3 • Ω0 := by rw [Ω0_eq_Ω0R]

end OmegaZero34
