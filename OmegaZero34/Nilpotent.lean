/-
Copyright (c) 2026 Benjamin Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Frohman
-/
import OmegaZero34.Form

/-!
# The unipotent logarithm is symplectic for Ω₀

`N = T0 - I` is not the tether. The tether, restricted to this lattice, is
`λ • Ω0`. `N` is a Hamiltonian infinitesimal symmetry of that form:

  N ∈ sp(V_ℚ, ω₀)   iff   Nᵀ * Ω0 + Ω0 * N = 0.

Geometrically `N` is the cusp: ker N = im N = span{γ, u} is the isotropic
vanishing plane. The tether is the pairing that makes that plane isotropic.
The fill at the cusp is the unipotent flow of `N` inside Sp(ω₀).
-/

set_option autoImplicit false

open Matrix

namespace OmegaZero34

/-- `N` lies in `sp(ω₀)`: a Hamiltonian infinitesimal symmetry of the tether
form, not the form itself. -/
lemma N_sp : Nᵀ * Ω0 + Ω0 * N = 0 := by native_decide

lemma N_mulVec_eq_zero_iff (x : Fin 4 → ℤ) :
    N.mulVec x = 0 ↔ x 2 = 0 ∧ x 3 = 0 := by
  constructor
  · intro hx
    have hx0 : N.mulVec x 0 = 0 := by rw [hx]; simp
    have hx1 : N.mulVec x 1 = 0 := by rw [hx]; simp
    rw [N_mulVec_zero] at hx0
    rw [N_mulVec_one] at hx1
    exact ⟨neg_eq_zero.mp hx1, hx0⟩
  · intro ⟨h2, h3⟩
    ext i
    fin_cases i
    · simp [N_mulVec_zero, h3]
    · simp [N_mulVec_one, h2]
    · simp [N_mulVec_two]
    · simp [N_mulVec_three]

/-- \(\ker N\) is the coordinate plane \(\mathrm{span}\{\gamma,u\}\). -/
lemma mem_ker_N (x : Fin 4 → ℤ) (h2 : x 2 = 0) (h3 : x 3 = 0) :
    N.mulVec x = 0 :=
  (N_mulVec_eq_zero_iff x).mpr ⟨h2, h3⟩

lemma gamma_mem_ker_N : N.mulVec ![1, 0, 0, 0] = 0 := N_gamma
lemma u_mem_ker_N : N.mulVec ![0, 1, 0, 0] = 0 := N_u

/-- \(\mathrm{im}\,N\subseteq\mathrm{span}\{\gamma,u\}\) because the last two coordinates vanish. -/
lemma im_N_in_gamma_u (x : Fin 4 → ℤ) :
    (N.mulVec x) 2 = 0 ∧ (N.mulVec x) 3 = 0 :=
  ⟨N_mulVec_two x, N_mulVec_three x⟩

/-- \(\mathrm{im}\,N=\ker N\) as subsets of \(\mathbb{Z}^4\): both are
\(\{x\mid x_2=x_3=0\}\). -/
lemma im_N_eq_ker_N (y : Fin 4 → ℤ) :
    (∃ x, N.mulVec x = y) ↔ N.mulVec y = 0 := by
  constructor
  · rintro ⟨x, rfl⟩
    have h := im_N_in_gamma_u x
    exact (N_mulVec_eq_zero_iff _).mpr h
  · intro hy
    obtain ⟨h2, h3⟩ := (N_mulVec_eq_zero_iff y).mp hy
    refine ⟨![0, 0, -y 1, y 0], ?_⟩
    ext i
    fin_cases i
    · simp [N_mulVec_zero]
    · simp [N_mulVec_one]
    · simp [N_mulVec_two, h2]
    · simp [N_mulVec_three, h3]

/-- The vanishing plane is \(\omega_0\)-isotropic: \(\omega_0(\gamma,u)=0\). -/
lemma vanishing_plane_isotropic : Ω0 0 1 = 0 := rfl

end OmegaZero34
