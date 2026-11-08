# Zenodo Draft Metadata (filled for copy-paste)

**Title:** The unique monodromy-invariant alternating form of type (1,6) on a (3,4,∞) lattice representation, and the restriction of a functorial symplectic structure

**Authors:** Benjamin Stanley Frohman (ORCID: 0009-0006-7068-3718)

**Description / Abstract:**
Let V = ℤ⁴ carry the representation of the triangle group Δ(3,4,∞) given by the matrices T₁, T₂ ∈ SL(4,ℤ) in Alpöge’s self-hosted note on a family of complex 2-tori. The ℚ-vector space of alternating bilinear forms on V_ℚ invariant under T₁ and T₂ is one-dimensional. A primitive integral generator is the matrix

Ω₀ = [[0, 0, 0, 1], [0, 0, 6, 0], [0, -6, 0, 0], [-1, 0, 0, 0]]

of determinant 36 and elementary-divisor type (1,6). The unipotent T₀ = (T₁ T₂)⁻¹ preserves the same form, and N = T₀ - I lies in 𝔰𝔭(V_ℚ, ω₀).

Consequently any monodromy-invariant alternating form on this local system—including the restriction of a functorial symplectic 2-form on families of complex 2-tori—is a unique rational multiple of ω₀. This organises the fibrewise pairing used in vanishing-cycle and unipotent-cusp calculations. It does not construct a compactification of the family, and it does not prove X ≃ S⁶.

All statements of Theorems A and B and of the linear-algebra proposition behind them (in both directions) are kernel-checked in Lean 4 with Mathlib (library OmegaZero34), without sorry and using only Lean’s standard axioms; Theorem C is conditional on hypotheses that are not formalized.

The note alpo.ge/s6.pdf states a monodromy-invariant form with pairings matching type (1,6) data (Q(γ, δ) = 1, Q(u, w) = 6 up to basis). The uniqueness forcing the form to be exactly λ Ω₀ is the calculation formalized here.

**Keywords:** symplectic lattice, monodromy, triangle group, Pfaffian, complex torus, Lean 4

**Notes:**
Author of this article and of the Lean 4 library OmegaZero34: Benjamin Stanley Frohman.
Matrices T₁, T₂, N, dual vectors, and the compactification claim are cited from L. Alpöge, self-hosted note announced 23 August 2026, https://alpo.ge/s6.pdf. They are cited, not absorbed.
Lean code: Apache-2.0. Text: CC-BY-4.0.
GitHub: https://github.com/BenFrohman/OmegaZero34
Concept DOI: 10.5281/zenodo.22153741
Previous versions: 10.5281/zenodo.22153742, 10.5281/zenodo.22240545
Reserved draft for this version: 10.5281/zenodo.23931801 (to be published)

**Related identifiers:**
- Software: https://github.com/BenFrohman/OmegaZero34
- Preprint source: paper/OmegaZero34-final.tex (this repo)

Copy the Description into the Zenodo description field, Notes into the notes, upload paper/OmegaZero34-final.pdf as the main file, and publish the reserved draft.