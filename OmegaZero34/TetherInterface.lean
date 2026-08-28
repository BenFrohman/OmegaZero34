/-
Copyright (c) 2026 Benjamin Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import OmegaZero34.Uniqueness
import Mathlib.Data.Matrix.Mul

/-!
# Conditional restriction lemma (the bridge)

On this lattice the tether *is* the form \(\omega_0\) (equivalently
\(\Omega_0\)), not the nilpotent \(N\) and not the Pfaffian. Hypotheses
H1–H3 of `Omega0_Tether_Bridge_Note.md` §6, specialised to this rank-four
local system, plus Theorem 3.1, imply that any such form restricts to
\(\lambda\omega_0\).

This file does **not** prove H1–H4 from a geometric manuscript. It proves
the one-line implication
\[
\text{alternating}+\text{monodromy-invariant}+\text{nondegenerate}
\;\Rightarrow\;
\omega=\lambda\Omega_0,\ \lambda\in\mathbb{Q}^\times.
\]
It does not construct \(X\) and does not prove \(X\simeq S^6\).
-/

set_option autoImplicit false

open Matrix

namespace OmegaZero34

/-- Lattice-level content of H1–H3 on this representation: an alternating,
monodromy-invariant, nondegenerate rational form on \(V_{\mathbb{Q}}\). -/
structure InvariantFormQ where
  ω : Matrix (Fin 4) (Fin 4) ℚ
  alt : transpose ω = -ω
  preserves_T1 : transpose T1R * ω * T1R = ω
  preserves_T2 : transpose T2R * ω * T2R = ω
  nondeg : ω.det ≠ 0

/-- Restriction lemma (Theorem 7.1, lattice form).

If a form on this local system is alternating and preserved by \(T_1,T_2\),
then it equals \(\lambda\Omega_0\) for a unique \(\lambda\in\mathbb{Q}\).
Nondegeneracy forces \(\lambda\neq 0\). -/
theorem restriction_lemma (F : InvariantFormQ) :
    F.ω = F.ω 0 3 • Ω0R ∧ F.ω 0 3 ≠ 0 := by
  have hw : F.ω = F.ω 0 3 • Ω0R :=
    uniqueness_over_Q F.ω F.alt F.preserves_T1 F.preserves_T2
  refine ⟨hw, ?_⟩
  intro h0
  have hω0 : F.ω = 0 := by
    rw [hw, h0, zero_smul]
  have : F.ω.det = 0 := by
    rw [hω0]
    exact det_zero (n := Fin 4) inferInstance
  exact F.nondeg this

/-- The scalar is unique. -/
theorem restriction_scalar_unique (F : InvariantFormQ) (t u : ℚ)
    (ht : F.ω = t • Ω0R) (hu : F.ω = u • Ω0R) :
    t = u :=
  uniqueness_scalar_unique F.ω t u ht hu

/-- Corollary 7.2, lattice form: both generators preserve \(\omega_0\)
(already checked a posteriori in `Form.lean`); any invariant form is a
multiple, so its automorphism group is \(\mathrm{Aut}(V,\omega_0)\). -/
theorem generators_preserve_Ω0 :
    T1ᵀ * Ω0 * T1 = Ω0 ∧ T2ᵀ * Ω0 * T2 = Ω0 :=
  ⟨T1_preserves_Ω0, T2_preserves_Ω0⟩

theorem restriction_integral (Ψ : Matrix (Fin 4) (Fin 4) ℤ)
    (hsk : transpose Ψ = -Ψ)
    (h1 : transpose T1 * Ψ * T1 = Ψ)
    (h2 : transpose T2 * Ψ * T2 = Ψ) :
    Ψ = Ψ 0 3 • Ω0 :=
  uniqueness_integral Ψ hsk h1 h2

/-
H4 (stability under field extension) is not used on this lattice:
uniqueness is already over Q and the integer form is primitive.
A geometric tether manuscript may supply H4 separately; this file does not
axiomatise it.
-/

end OmegaZero34
