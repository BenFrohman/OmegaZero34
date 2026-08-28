# AGENT BRIEFING — Ω₀, dual-lattice invariants, and a tether restriction lemma
## Feed this file in full to a Grok CLI / Lean agent
## Date of computation: 2026-08-27
## Scope: lattice-level mathematics of the (3,4,∞) representation in alpo.ge/s6.pdf

---

# 0. HARD SCOPE LOCK (READ FIRST)

This briefing contains **one proved lattice theorem** and a **research scaffold**.

**Proved here (exact linear algebra, 2026-08-27):**
- The space of rational alternating forms on \(V=\mathbb{Q}^4\) invariant under the source matrices \(T_1,T_2\) is one-dimensional.
- An explicit primitive integral generator \(\Omega_0\) is given below.
- \(\det\Omega_0=36\neq 0\).
- \(T_1,T_2,T_0\) all preserve \(\Omega_0\).
- Dual matrices \(A_j=(T_j^{-1})^T\) and the source vectors \(\varepsilon,\varepsilon'\) check out.

**Not proved here, and the agent must not claim them:**
- That Alpöge “failed to solve” or “failed to disclose” a form. The PDF says the representation is used “in place of the symplectic one.” That sentence is compatible with a *non-unimodular* form. Whether the PDF constructs \(\Omega_0\) is a citation question, not a moral one.
- That a private Frohmanian / metriplectic / holographic manuscript already proves \(X\simeq S^6\).
- That \(\Omega_0\) *is* the tether form. The correct claim is: **any** monodromy-invariant alternating form on this lattice is a rational multiple of \(\Omega_0\). A tether restriction lemma must *identify* the scalar.

**Priority that is defensible:**
- Timestamp the **explicit matrix \(\Omega_0\)**, the uniqueness theorem, and a dual-lattice analysis.
- If a finished geometric manuscript already contains a functorial symplectic form on families of tori, write a **restriction lemma**: that form, pulled back to this monodromy representation, equals \(\lambda\Omega_0\).
- Do not title anything “we constructed the complex structure on \(S^6\) before Alpöge.” That is not what this calculation shows.

**Agent job:**
1. Formalize \(\Omega_0\) and the uniqueness theorem in Lean 4 (sorry-free).
2. Formalize the dual action, \(\varepsilon,\varepsilon'\), and the rational dual form \(\Omega_0^{-1}\).
3. Write the *statement* of a restriction lemma with a precise hole for the user’s geometric input (do not invent the geometric proof).
4. Produce a short note (README + Lean module docstring) that a human can cite.

---

# 1. SOURCE MATRICES (copy verbatim)

Basis of \(V=\mathbb{Z}^4\): \((\gamma,u,w,\delta)\).

```
T1 = [[ 1,  0, -6,  2],
      [ 0, -1,  1,  1],
      [ 0, -1,  0,  1],
      [ 0,  0,  0,  1]]

T2 = [[ 1,  6,  0, -3],
      [ 0,  0, -1,  1],
      [ 0,  1,  0,  0],
      [ 0,  0,  0,  1]]

T1*T2 = [[ 1,  0,  0, -1],
         [ 0,  1,  1,  0],
         [ 0,  0,  1,  0],
         [ 0,  0,  0,  1]]

T0 = (T1*T2)⁻¹ = [[ 1,  0,  0,  1],
                  [ 0,  1, -1,  0],
                  [ 0,  0,  1,  0],
                  [ 0,  0,  0,  1]]

N = T0 - I = [[ 0,  0,  0,  1],
              [ 0,  0, -1,  0],
              [ 0,  0,  0,  0],
              [ 0,  0,  0,  0]]
```

Facts (already verified exactly):
- \(\det T_1=\det T_2=\det T_0=1\)
- \(T_1^3=I\), order exactly 3
- \(T_2^4=I\), order exactly 4
- \(N^2=0\), \(N\neq 0\)
- \(N\gamma=Nu=0\), \(Nw=-u\), \(N\delta=\gamma\)

Dual action \(A=(T^{-1})^T\):

```
A1 = [[ 1,  0,  0,  0],
      [ 6,  0,  1,  0],
      [-6, -1, -1,  0],
      [-2,  1,  0,  1]]

A2 = [[ 1,  0,  0,  0],
      [ 0,  0, -1,  0],
      [-6,  1,  0,  0],
      [ 3,  0,  1,  1]]

A0 = [[ 1,  0,  0,  0],
      [ 0,  1,  0,  0],
      [ 0,  1,  1,  0],
      [-1,  0,  0,  1]]
```

Source fixed vectors (dual coordinates \((\hat\gamma,\hat u,\hat w,\hat\delta)\)):
```
ε  = (1, 2, -4, 0)    # A1 ε  = ε
ε' = (1, 3, -3, 0)    # A2 ε' = ε'
```

---

# 2. THE EXPLICIT FORM Ω₀ (THE OBJECT TO PUBLISH)

## 2.1 Matrix
\[
\Omega_0=\begin{pmatrix}
0 & 0 & 0 & 1 \\
0 & 0 & 6 & 0 \\
0 & -6 & 0 & 0 \\
-1 & 0 & 0 & 0
\end{pmatrix}
\in\mathrm{M}_4(\mathbb{Z}).
\]

Pairings in the basis \((\gamma,u,w,\delta)\):
\[
\omega_0(\gamma,\delta)=1,\qquad \omega_0(u,w)=6,
\]
all other unordered basis pairings zero (except the skew counterparts).

## 2.2 Invariants of the form
- \(\Omega_0^T=-\Omega_0\)
- \(\mathrm{Pf}(\Omega_0)=af-be+cd=6\) with the standard Pfaffian on parameters \((a,b,c,d,e,f)=(0,0,1,6,0,0)\)
- \(\det\Omega_0=36\neq 0\)
- Not unimodular: \(\det\neq\pm 1\). This is the precise meaning of “not the standard symplectic/Siegel principal-polarization lattice.”
- \(T_i^T\Omega_0 T_i=\Omega_0\) for \(i=1,2\) and for \(T_0\).

## 2.3 Uniqueness theorem (proved by exact linear algebra)
Let \(\mathcal{A}\) be the \(\mathbb{Q}\)-vector space of \(4\times 4\) skew matrices.
The linear map
\[
\Phi:\mathcal{A}\to\mathcal{A}\oplus\mathcal{A},\qquad
\Omega\mapsto\bigl(T_1^T\Omega T_1-\Omega,\ T_2^T\Omega T_2-\Omega\bigr)
\]
has
\[
\mathrm{rank}\,\Phi=5,\qquad \dim\ker\Phi=1,\qquad \ker\Phi=\mathbb{Q}\cdot\Omega_0.
\]
Hence:

**Lemma (Uniqueness).**  
If \(\Psi\in\mathrm{M}_4(\mathbb{Q})\) is skew and \(T_1^T\Psi T_1=\Psi=T_2^T\Psi T_2\), then there is a unique \(\lambda\in\mathbb{Q}\) with \(\Psi=\lambda\Omega_0\).

**Lemma (Integrality).**  
The \(\mathbb{Z}\)-module of integral skew matrices invariant under \(T_1\) and \(T_2\) is \(\mathbb{Z}\cdot\Omega_0\).

## 2.4 Lean target for Ω₀
```lean
def Ω0 : Matrix (Fin 4) (Fin 4) ℤ :=
  !![ 0,  0,  0,  1;
      0,  0,  6,  0;
      0, -6,  0,  0;
     -1,  0,  0,  0]

theorem Ω0_skew : Ω0ᵀ = -Ω0 := by native_decide
theorem Ω0_det : Ω0.det = 36 := by native_decide
theorem T1_preserves_Ω0 : T1ᵀ * Ω0 * T1 = Ω0 := by native_decide
theorem T2_preserves_Ω0 : T2ᵀ * Ω0 * T2 = Ω0 := by native_decide
theorem T0_preserves_Ω0 : T0ᵀ * Ω0 * T0 = Ω0 := by native_decide
```

Then prove uniqueness over \(\mathbb{Q}\) by solving the 6-parameter system in Lean
(or by quoting a `native_decide` check that a general skew \(\Psi-\lambda\Omega_0\) vanishes iff the five independent entries vanish). Prefer an explicit parameter proof:

```
-- general skew
-- Ω(a,b,c,d,e,f)
-- T1-invariance + T2-invariance ⇒ a=b=e=f=0 ∧ c = d/6
-- hence Ω = (d/6) • Ω0_rational = (d) • (Ω0/6) wait: Ω0 corresponds to (0,0,1,6,0,0)
-- so Ω(0,0,c,d,0,0) with c=d/6, i.e. Ω = (d/6) * Ω0
```

`#print axioms` must be recorded.

---

# 3. DUAL LATTICE — WHAT TO EXPLORE AND FORMALIZE

## 3.1 Dual form
Identify \(V^*\cong\mathbb{Q}^4\) with the dual basis. The inverse matrix
\[
\Omega_0^{-1}=\frac{1}{36}\mathrm{adj}(\Omega_0)
\]
represents the dual pairing on \(V^*\) over \(\mathbb{Q}\).

Compute `adj(Ω0)` exactly and put both \(\Omega_0^{-1}\) and \(36\Omega_0^{-1}\) (the primitive integral dual matrix) in Lean.

**Agent must compute and record:**
```
adj(Ω0) = ?
Ω0⁻¹ = ?
Ω0_dual_int := 36 • Ω0⁻¹   -- should be in M₄(ℤ)
det(Ω0_dual_int) = ?
```
Then prove
\[
A_j^T\,\Omega_0^{\mathrm{dual}}\,A_j=\Omega_0^{\mathrm{dual}}
\]
for \(j=1,2,0\), where \(\Omega_0^{\mathrm{dual}}\) is either \(\Omega_0^{-1}\) or the integral multiple, consistently.

## 3.2 Elementary divisors / type of the form
Over \(\mathbb{Z}\), a nondegenerate alternating form on a free module of rank 4 can be put in the normal form
\[
\begin{pmatrix}0&d_1\\-d_1&0\end{pmatrix}\oplus\begin{pmatrix}0&d_2\\-d_2&0\end{pmatrix},\qquad d_1\mid d_2.
\]
Here the pairings are \(1\) and \(6\), and \(1\mid 6\), so the **type** is \((d_1,d_2)=(1,6)\).

**Lemma to prove (elementary, or Lean):**
\(\Omega_0\) is equivalent over \(\mathrm{GL}(4,\mathbb{Z})\) (or after checking, over \(\mathrm{SL}(4,\mathbb{Z})\)) to
\[
J_{1,6}:=\begin{pmatrix}0&1&0&0\\-1&0&0&0\\0&0&0&6\\0&0&-6&0\end{pmatrix}
\]
or a documented permutation-similar form. If the given basis already *is* that normal form up to ordering \((\gamma,\delta,u,w)\), say so explicitly:

In the ordered basis \((\gamma,\delta,u,w)\) the form is block-diagonal
\[
\begin{pmatrix}0&1\\-1&0\end{pmatrix}\oplus\begin{pmatrix}0&6\\-6&0\end{pmatrix}.
\]
That is the symplectic type \((1,6)\).

This is the object Alpöge’s sentence “in place of the symplectic one” is pointing at: **not** type \((1,1)\), which would be the principal/Siegel case.

## 3.3 Radical over \(\mathbb{Z}/m\)
For each prime \(p\mid 36\), i.e. \(p=2,3\), the reduction of \(\omega_0\) modulo \(p\) is degenerate.
- \(\mathrm{mod}\,2\): \(\omega_0(u,w)=6\equiv 0\), so the \((u,w)\)-plane is isotropic and in the left kernel with \(\gamma,\delta\) still pairing as \(1\).
- \(\mathrm{mod}\,3\): same, \(6\equiv 0\).

**Lemma:** \(\ker(\omega_0\otimes\mathbb{F}_p)\) for \(p=2,3\) is 2-dimensional, spanned by the reductions of \(u,w\).

This is the arithmetic shadow of “the form is 6 times a volume on a plane.” Record it.

## 3.4 Unipotent logarithm and the form
\(N=T_0-I\) satisfies \(N^2=0\). For a symplectic unipotent, \(N\) should be an infinitesimal symplectic endomorphism:
\[
\omega_0(Nx,y)+\omega_0(x,Ny)=0\qquad\text{i.e.}\qquad N^T\Omega_0+\Omega_0 N=0.
\]
**Prove this identity in Lean.** It is the Lie-algebra condition \(\mathfrak{sp}(\omega_0)\).

Then compute the image and kernel of \(N\):
\[
\ker N=\mathrm{span}\{\gamma,u\},\qquad
\mathrm{im}\,N=\mathrm{span}\{\gamma,-u\}=\mathrm{span}\{\gamma,u\}.
\]
So \(\mathrm{im}\,N=\ker N\), rank \(N=2\), and this plane is \(\omega_0\)-**isotropic**? Check:
\(\omega_0(\gamma,u)=0\). Yes, the vanishing plane of the cusp is isotropic for \(\omega_0\). That matches a standard nilpotent in \(\mathfrak{sp}\).

## 3.5 Coinvariants vs. the form
Source: \(\ker\gamma=\langle\hat u,\hat w,\hat\delta\rangle\) on \(\Lambda\), coinvariants rank 1.
On \(V\), the cusp vanishing cycles are \(\hat w,\hat\delta\) (source text). Under \(\omega_0\), \(\delta\) is dual to \(\gamma\) and \(w\) is (6 times) dual to \(u\).

**Compute and record** the \(\omega_0\)-orthogonal of \(\mathrm{span}\{\gamma,u\}\) and of \(\mathrm{span}\{w,\delta\}\). This is the lattice-level analogue of vanishing cycles vs. dual vanishing cycles.

## 3.6 Group of integral automorphisms
Let
\[
G:=\{g\in\mathrm{SL}(4,\mathbb{Z}): g^T\Omega_0 g=\Omega_0\}.
\]
Then \(\langle T_1,T_2\rangle\subseteq G\). \(G\) is an arithmetic subgroup of the \(\mathbb{Q}\)-algebraic group \(\mathrm{Sp}(V_{\mathbb{Q}},\omega_0)\cong\mathrm{Sp}(4,\mathbb{Q})\), but it is **not** conjugate in \(\mathrm{GL}(4,\mathbb{Z})\) to the standard \(\mathrm{Sp}(4,\mathbb{Z})\) because the form is not unimodular.

Agent: do **not** try to classify \(G\) fully in the first pass. Record the containment and the type \((1,6)\).

---

# 4. SCAFFOLD FROM FINISHED GEOMETRIC WORK (TETHER / METRIPLECTIC / HOLOGRAPHIC)

This section is a **interface specification**, not a claim that the geometric manuscripts are kernel-checked.

## 4.1 What the geometric side must supply
Assume a finished manuscript provides an object \(\omega_{\mathrm{Teth}}\) with these properties, stated as hypotheses `H1–H4`. The agent should encode them as `axiom`s or as `variable` hypotheses in a separate module `TetherInterface.lean`, **not** as proved theorems unless the user pastes the actual Lean of those proofs.

```
H1 (Existence). For a family of complex 2-tori (or polarized rank-4 local systems)
    there is a section ω_Teth of alternating forms on the fibrewise H₁.

H2 (Nondegeneracy over ℚ). ω_Teth is nondegenerate on V_ℚ.

H3 (Monodromy invariance). Parallel transport / monodromy preserves ω_Teth.

H4 (Functoriality / field extension). ω_Teth is stable under base change
    and under morphisms of the category in which the tether is defined.
```

## 4.2 The restriction lemma (THE actual priority object)
On *this* local system \(V=\mathbb{Z}^4\) with monodromy \(\langle T_1,T_2\rangle\), hypotheses H2+H3 plus the uniqueness theorem of §2.3 give:

**Restriction Lemma (conditional on H2, H3).**  
There exists a unique \(\lambda\in\mathbb{Q}^\times\) such that
\[
\omega_{\mathrm{Teth}}\big|_{V}=\lambda\,\omega_0.
\]
If the geometric theory also produces an integral pairing, then \(\lambda\in\mathbb{Z}\setminus\{0\}\) and in fact \(\omega_{\mathrm{Teth}}|_V=n\,\omega_0\) for a unique \(n\in\mathbb{Z}\setminus\{0\}\).

**This is the precise new lemma that is not in the PDF.**  
The PDF does not write \(\Omega_0\). The uniqueness theorem forces any invariant form — including a tether form, if it exists and is alternating and monodromy-invariant on this lattice — to be a multiple of \(\Omega_0\).

## 4.3 How to use this without overclaiming
Correct public sentence:

> The monodromy representation of \(\Delta(3,4,\infty)\) on \(\mathbb{Z}^4\) appearing in [Alpöge, alpo.ge/s6.pdf] preserves a unique-up-to-scalar rational alternating form, generated by the explicit matrix \(\Omega_0\) of type \((1,6)\). In particular the representation is symplectic over \(\mathbb{Q}\) but not principally polarized over \(\mathbb{Z}\). Any functorial monodromy-invariant symplectic structure on this local system (including a restriction of a tether / metriplectic form) is a scalar multiple of \(\omega_0\).

Incorrect public sentence:

> Alpöge failed to disclose the form because he never solved it; our prior tether theorem already constructed the complex \(S^6\).

The second sentence is not supported by this calculation.

## 4.4 What the geometric manuscripts still have to do
To *use* the tether as more than a name:

1. Quote the exact statement of \(\omega_{\mathrm{Teth}}\) from the user’s manuscript (definition + invariance theorem), with page/lemma numbers.
2. Exhibit the identification of the fibrewise \(H_1\) of the \((3,4,\infty)\) family with this \(V=\mathbb{Z}^4\).
3. Apply the Restriction Lemma and compute \(\lambda\) (or \(n\)).
4. Only then discuss implications for period maps, \(\tau,\mu,\beta\), or the compactification.

Steps 2–3 are not in this briefing. They require the user’s geometric text.

## 4.5 Metriplectic / holographic extra structure
If the finished work also has a metric / dissipative bracket / holographic dual:
- The symplectic leaf on this lattice must still be \(\omega_0\) (uniqueness).
- Any compatible metric \(g\) on \(V_{\mathbb{R}}\) is *not* unique; do not claim uniqueness for \(g\).
- A metriplectic pair \((\omega,g)\) restricted here is \((\lambda\omega_0, g|_V)\). The new content would be a formula for \(g|_V\) in the basis \((\gamma,u,w,\delta)\). Do not invent that matrix.

---

# 5. AGENT WORKFLOW (EXECUTE IN ORDER)

1. Create a Lean 4 project `OmegaZero34` with Mathlib.
2. File `Matrices.lean`: T1, T2, T0, N, dets, powers, N^2=0, basis action of N. No sorry.
3. File `Form.lean`: Ω0, skew, det=36, three preservation identities. No sorry.
4. File `Uniqueness.lean`: 6-parameter skew family; prove invariance ⇒ multiple of Ω0 over ℚ. No sorry if feasible; if the parameter chase is long, do it by `ext` + solving the linear system with `native_decide` on coefficients, and document axioms.
5. File `Dual.lean`: A1, A2, A0, ε, ε' fixed, compute adj(Ω0) and integral dual form, prove dual invariance.
6. File `Nilpotent.lean`: \(N^T\Omega_0+\Omega_0 N=0\), ker/im of N, isotropy of im N.
7. File `Type.lean`: statement that the form has elementary divisors (1,6); change-of-basis to block form if short.
8. File `TetherInterface.lean`: `variable` hypotheses H1–H4 and the *conditional* Restriction Lemma. Do not fake a proof of H1–H4.
9. README with the “correct public sentence” of §4.3 and the scope lock of §0.
10. `#print axioms` dump for every headline theorem into `AXIOMS.md`.

Do not depend on `deancureton/sphere-six-complex`.
Do not formalize \(X\simeq S^6\).
Do not add an axiom named `AlpogeMissedTheForm`.

---

# 6. WHAT A PUBLIC ARTIFACT SHOULD LOOK LIKE (WHEN THE LEAN BUILDS)

**Repo title:** `omega0-triangle-34` or `sl4-monodromy-form-34-infty`

**First paragraph of README:**
The matrices \(T_1,T_2\) of the \((3,4,\infty)\) representation in Alpöge’s self-hosted note `alpo.ge/s6.pdf` preserve a unique-up-to-scalar rational alternating form, generated by
\[
\Omega_0=\mathrm{diag}\text{-skew}(1,6)
\]
in the sense of §2. The form has type \((1,6)\) and determinant 36. This repository checks those identities in Lean 4. It does not treat the compactification theorem of that note.

**Zenodo / DOI:** only after `lake build` is clean and `AXIOMS.md` exists. Cite Alpöge. Title must not contain “complex structure on S^6” unless the geometry is also proved.

**Discussion repo without Lean:** do not open one.

---

# 7. REFERENCE VALUES FOR THE AGENT (DO NOT RECOMPUTE WRONG)

Ω0 pairings: ω(γ,δ)=1, ω(u,w)=6.

Pfaffian 6, det 36.

Kernel of the invariance map: 1-dimensional over ℚ.

T0 and N as in §1.

A1ε=ε, A2ε'=ε'.

N is infinitesimal symplectic for Ω0.

Type (1,6), not (1,1).

END.
