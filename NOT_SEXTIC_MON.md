# This monodromy is not sextic fourfold monodromy

Author: Benjamin Stanley Frohman. Copyright 2026. Apache-2.0.

Documentation lock. No Lean change.

The group computed in this repository is

```text
Mon_Δ = ⟨T1, T2, T0⟩ ⊂ SL(4, Z)
```

acting on the lattice ℤ⁴ with basis (γ, u, w, δ), preserving the unique
rational alternating form Ω₀ of type (1,6). Source of the matrices:
Alpöge, `alpo.ge/s6.pdf`. Uniqueness of Ω₀ is checked here.

That is the monodromy of Δ(3,4,∞) on a rank-4 local system.

It is **not**

```text
Mon(U) = O^#(L_2605)
```

the monodromy of the universal family of smooth sextic fourfolds in ℝ⁵.
The number 2605 is b₄ − 1 for a general sextic (see BenFrohman/HODGE
`docs/MONODROMY_LEDGER.md` and `docs/HODGE_NUMBERS.md`). No file in this
repository is a subgroup of that orthogonal group.

Do not identify Ω₀ with the intersection form on H⁴_prim of V(F).
H⁴ of a sextic fourfold is orthogonal of rank 2606. Ω₀ is symplectic of
rank 4.
