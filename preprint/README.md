# What this preprint proves

**Author.** Benjamin Stanley Frohman. Preprint CC-BY-4.0; Lean Apache-2.0.
Alpöge is cited for \(T_1,T_2\) and the compactification claim, not listed as
a co-author. Reusable matrix lemmas are in `OmegaZero34/ForMathlib/` for
Mathlib PRs (`Authors: Benjamin Frohman`).

**File.** `main.tex`  
**Title (safe).** The unique monodromy-invariant alternating form of type (1,6) on a (3,4,∞) lattice representation, and the restriction of a functorial symplectic structure  
**Sources, in order.** `Omega0_Tether_Bridge_Note.md`, `Omega0_Expanded_Proofs.md`, `Omega0_Secondary_Writeup_Zenodo_Feed.md`  
**License.** CC-BY-4.0

## Theorems (only these three)

**Theorem A (existence and uniqueness).**  
The \(\mathbb{Q}\)-space of alternating forms on \(V_{\mathbb{Q}}=\mathbb{Q}^4\) invariant under the published matrices \(T_1,T_2\) is one-dimensional, spanned by \(\omega_0\) with Gram matrix \(\Omega_0\). The \(\mathbb{Z}\)-module of integral such forms is \(\mathbb{Z}\cdot\omega_0\). The form is nondegenerate, of elementary-divisor type \((1,6)\). \(\mathrm{Pf}(\Omega_0)=6\), \(\det\Omega_0=36\).

**Theorem B (cusp).**  
\(N=T_0-I\) lies in \(\mathfrak{sp}(V_{\mathbb{Q}},\omega_0)\), i.e. \(N^T\Omega_0+\Omega_0 N=0\). \(\ker N=\mathrm{im}\,N=\mathrm{span}\{\gamma,u\}\) is \(\omega_0\)-isotropic.

**Theorem C (restriction, conditional).**  
If a functorial symplectic 2-form (the tether fragment: alternating, nondegenerate over \(\mathbb{Q}\), monodromy-invariant) is identified with this fibrewise lattice, then
\[
\mathrm{tether}\big|_{V_{\mathbb{Q}}}=\lambda\omega_0
\]
for a unique \(\lambda\in\mathbb{Q}^\times\).

## Dictionary (not theorems)

| Geometric object | Lattice object |
|---|---|
| tether form on this fibre | \(\lambda\omega_0\) |
| monodromy | \(\langle T_1,T_2\rangle\subset\mathrm{Aut}(V,\omega_0)\) |
| cusp generator | \(T_0=I+N\) |
| infinitesimal cusp / vanishing | \(N\in\mathfrak{sp}(\omega_0)\) |
| type / not principal polarization | \(\mathrm{Pf}(\Omega_0)=6\) |

Tether \(=\omega_0\) up to \(\lambda\). \(N\) is how the family degenerates while preserving the tether. \(\mathrm{Pf}\) is how large that tether is on an integral frame. The tether is not \(N\) and not the Pfaffian.

## What is not proved

- \(X\simeq S^6\), or that \(X\) is a homology sphere.
- Existence of period functions \(\tau,\mu,\beta\), or of the compactification \(X\).
- Positivity of \(\omega_0(\,\cdot\,,J(z)\,\cdot\,)\).
- That the tether constructs the fillings.
- That any laboratory trained on a Frohman corpus, or that `HopfProblem` is a transcription of the tether.

## Citations

- **Alpöge** for \(T_1,T_2\), \(N\), \(\varepsilon,\varepsilon'\), the period matrix, and the compactification *claim*: L. Alpöge, self-hosted note announced 23 August 2026, `https://alpo.ge/s6.pdf`.
- **This note** for \(\Omega_0\), uniqueness, type \((1,6)\), \(N\in\mathfrak{sp}(\omega_0)\), and Theorem C.

## Author’s note

The section “Author’s note on priority” is unnumbered (`\section*`) and is **not** a theorem. It is **not** in the abstract. It records a date-comparison claim and labels the training-run suspicion unverified. If a compile promotes it into the abstract, reject that compile.

## Kernel-checked Lean (this is the formal record)

The accompanying Lean 4 library (`OmegaZero34`) is the kernel-checked form of Theorems A and B and of the implication in Theorem C. Every headline theorem in that library is complete. Headline theorems and their axiom traces:

| Lean name | Matches | Axioms |
|---|---|---|
| `uniqueness_over_Q` / `uniqueness_integral` | Theorem A | `propext`, `Classical.choice`, `Quot.sound` |
| `N_sp` plus kernel/image lemmas | Theorem B | `native_decide` on the matrix identity; rest algebraic |
| `restriction_lemma` | Theorem C as an implication from a structure of hypotheses | `propext`, `Classical.choice`, `Quot.sound` |

Concrete \(4\times 4\) integer identities (`T1_preserves_Ω0`, dets, orders, dual fixed vectors) use disclosed `native_decide`. H1–H4 of a geometric tether manuscript are *not* kernel-checked; only the implication “alternating + invariant + nondegenerate \(\Rightarrow\lambda\Omega_0\)” is.

Do not cite any other Lean file, draft, or `sorry` sketch as the formalization of this note.

## Build

```
pdflatex main.tex
pdflatex main.tex
```

From `~/lean-projects/NS_Millennium_Proof`: `lake build OmegaZero34`.

Do not use the unsafe title “A complex structure on \(S^6\) from the Frohmanian tether.”
