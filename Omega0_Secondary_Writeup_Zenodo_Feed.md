# Secondary write-up: dictionary, documentation, and author note
## Feed this file together with `Omega0_Tether_Bridge_Note.md` and `Omega0_Expanded_Proofs.md`

**Purpose.** This file is the companion to the lattice theorem. It (i) identifies the Frohmanian tether with the objects already named, (ii) records the accompanying calculations so a later LaTeX pass does not have to invent them, (iii) states what a Zenodo preprint may and may not claim, and (iv) prints an *author’s note* on priority. Section 8 is a first-person claim by the author. It is not a theorem and it is not an independent verification that any laboratory trained on any private corpus.

**Suggested preprint title (safe):**
*The unique monodromy-invariant alternating form of type (1,6) on a (3,4,∞) lattice representation, and the restriction of a functorial symplectic structure*

**Suggested preprint title (unsafe, do not use):**
*A complex structure on S⁶ from the Frohmanian tether*

---

## 1. Dictionary: what the tether is in this picture

Three objects appear in the same calculation. They are not interchangeable.

| Object | Symbol | Type of mathematical thing | Role |
|---|---|---|---|
| Invariant pairing | \(\omega_0\), matrix \(\Omega_0\) | alternating bilinear form on \(V=\mathbb{Z}^4\) | unique monodromy-invariant symplectic structure on this lattice |
| Cusp logarithm | \(N=T_0-I\) | nilpotent endomorphism, \(N^2=0\), rank \(2\) | infinitesimal monodromy at the infinite vertex |
| Pfaffian | \(\mathrm{Pf}(\Omega_0)=6\) | integer | symplectic volume; records type \((1,6)\) |

**Identification used in this series.**
A carefully stated fragment of a Frohmanian tether is a functorial symplectic 2-form on (the first homology of) complex 2-tori: nondegenerate over \(\mathbb{Q}\), invariant under monodromy, stable under field extension. Restricted to *this* representation, uniqueness forces
\[
\text{tether}\big|_{V_{\mathbb{Q}}}=\lambda\,\omega_0
\]
for a unique \(\lambda\in\mathbb{Q}^\times\).

Hence, in this picture:

- tether **=** the form \(\lambda\omega_0\);
- tether **≠** \(N\);
- tether **≠** \(\mathrm{Pf}(\Omega_0)\).

**Why not \(N\).**  
\(N\) is an element of the symplectic Lie algebra of the form,
\[
N\in\mathfrak{sp}(V_{\mathbb{Q}},\omega_0)\qquad\Longleftrightarrow\qquad
N^T\Omega_0+\Omega_0 N=0.
\]
It is a Hamiltonian infinitesimal symmetry of the tether form, and geometrically the vanishing operator of the cusp. The form is the pairing; \(N\) is a vector field that preserves the pairing. Slogan that does not lie:

> the tether is \(\omega\); the fill at the cusp is the unipotent flow of \(N\) inside \(\mathrm{Sp}(\omega)\).

**Why not the Pfaffian.**  
\(\mathrm{Pf}(\Omega_0)=6\) is a scalar invariant of \(\omega_0\). It is the reason the form is not a principal polarization (type \((1,1)\) would have Pfaffian \(\pm 1\)). It is not a 2-form and not a local system. If one wants a single integer attached to the tether on this lattice, \(6\) is that integer. That still does not make \(\mathrm{Pf}\) equal to the tether.

**Full dictionary for the family.**
\[
\begin{align*}
\text{tether form on this fibre} &\longleftrightarrow \lambda\omega_0,\\
\text{monodromy} &\longleftrightarrow \langle T_1,T_2\rangle\subset\mathrm{Aut}(V,\omega_0),\\
\text{cusp generator} &\longleftrightarrow T_0=I+N,\\
\text{infinitesimal cusp / vanishing} &\longleftrightarrow N\in\mathfrak{sp}(\omega_0),\\
\text{vanishing plane} &\longleftrightarrow \ker N=\mathrm{im}\,N=\mathrm{span}\{\gamma,u\},\\
\text{type / non-principal polarization} &\longleftrightarrow \mathrm{Pf}(\Omega_0)=6.
\end{align*}
\]

---

## 2. Why this object is worth writing down

Alpöge’s note exhibits explicit matrices \(T_1,T_2\in\mathrm{SL}(4,\mathbb{Z})\) for \(\Delta(3,4,\infty)\) and uses them “in place of the symplectic one.” That sentence is exact once the form is computed: the representation *is* symplectic over \(\mathbb{Q}\), but the integral form is of type \((1,6)\), not the Siegel type \((1,1)\). The matrix \(\Omega_0\) is the missing Gram matrix.

Three reasons this is independently citable, even if one never mentions a tether:

1. **Uniqueness.** The space of invariant rational alternating forms is one-dimensional. Any later paper that writes “the monodromy preserves a symplectic form” on this example is, up to scalar, writing \(\omega_0\).
2. **Type.** Type \((1,6)\) explains why the representation is not a map to \(\mathrm{Sp}(4,\mathbb{Z})\) in the principal-polarization embedding. Arithmetic reductions modulo \(2\) and \(3\) are degenerate on the \((u,w)\)-plane.
3. **Cusp calculus.** The unipotent logarithm automatically lies in \(\mathfrak{sp}(\omega_0)\) and the vanishing plane is isotropic. That is the linear algebra a Mumford-type filling reads.

A functorial symplectic theory (tether) is then a *source* of a form on a class of tori. On this example the source, if it exists and is alternating and monodromy-invariant, cannot produce anything except \(\lambda\omega_0\). That is the bridge. It organises fibrewise data. It does not construct the compact threefold and does not prove diffeomorphism to \(S^6\).

---

## 3. Matrices (copy-ready)

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

T0 = [[ 1,  0,  0,  1],
      [ 0,  1, -1,  0],
      [ 0,  0,  1,  0],
      [ 0,  0,  0,  1]]

N  = [[ 0,  0,  0,  1],
      [ 0,  0, -1,  0],
      [ 0,  0,  0,  0],
      [ 0,  0,  0,  0]]

Ω0 = [[  0,  0,  0,  1],
      [  0,  0,  6,  0],
      [  0, -6,  0,  0],
      [ -1,  0,  0,  0]]
```

Pairings: \(\omega_0(\gamma,\delta)=1\), \(\omega_0(u,w)=6\).  
\(\mathrm{Pf}(\Omega_0)=6\), \(\det\Omega_0=36\).

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

Source fixed vectors on \(\Lambda=V^*\):
\(\varepsilon=(1,2,-4,0)\), \(\varepsilon'=(1,3,-3,0)\).

Inverse and adjugate:
\[
\Omega_0^{-1}=\begin{pmatrix}0&0&0&-1\\0&0&-1/6&0\\0&1/6&0&0\\1&0&0&0\end{pmatrix},\qquad
\mathrm{adj}(\Omega_0)=\begin{pmatrix}0&0&0&-36\\0&0&-6&0\\0&6&0&0\\36&0&0&0\end{pmatrix}.
\]

---

## 4. Accompanying linear algebra (condensed; full residuals in the expanded-proofs file)

General skew matrix coordinates \((a,b,c,d,e,f)\):
\[
\Omega=\begin{pmatrix}0&a&b&c\\-a&0&d&e\\-b&-d&0&f\\-c&-e&-f&0\end{pmatrix}.
\]

Independent residuals of \(T_1^T\Omega T_1-\Omega\):
\[
-2a-b,\quad a-b,\quad a+b,\quad -6(a+b),\quad 2a+2b-2e-f,\quad -8a-6b-6c+d+e-f.
\]

Independent residuals of \(T_2^T\Omega T_2-\Omega\):
\[
-a+b,\quad -a-b,\quad a,\quad -6a,\quad 6a+3b+6c-d-e+f,\quad -3a-e-f.
\]

Solution: \(a=b=e=f=0\) and \(c=d/6\). Primitive integral generator: \(\Omega_0\) (\(c=1\), \(d=6\)).

Direct identities:
\[
T_1^T\Omega_0 T_1=\Omega_0,\qquad
T_2^T\Omega_0 T_2=\Omega_0,\qquad
T_0^T\Omega_0 T_0=\Omega_0,\qquad
N^T\Omega_0+\Omega_0 N=0.
\]

Images used in the pairing checks:
\[
\begin{align*}
T_1\gamma&=\gamma,& T_1u&=-u-w,& T_1w&=-6\gamma+u,& T_1\delta&=2\gamma+u+w+\delta,\\
T_2\gamma&=\gamma,& T_2u&=6\gamma+w,& T_2w&=-u,& T_2\delta&=-3\gamma+u+\delta,\\
T_0\gamma&=\gamma,& T_0u&=u,& T_0w&=-u+w,& T_0\delta&=\gamma+\delta,\\
N\gamma&=0,& Nu&=0,& Nw&=-u,& N\delta&=\gamma.
\end{align*}
\]

Every residual above is derived from \(\omega(Tx,Ty)-\omega(x,y)\) on basis pairs in `Omega0_Expanded_Proofs.md`. A LaTeX agent must copy those derivations, not replace them with “a computation shows.”

---

## 5. Theorems to print in the preprint (and only these as theorems)

**Theorem A (existence and uniqueness).**  
The \(\mathbb{Q}\)-vector space of alternating forms on \(V_{\mathbb{Q}}\) invariant under \(T_1\) and \(T_2\) is one-dimensional, spanned by \(\omega_0\). The \(\mathbb{Z}\)-module of integral such forms is \(\mathbb{Z}\cdot\omega_0\). The form is nondegenerate, of type \((1,6)\).

**Theorem B (cusp).**  
\(N\in\mathfrak{sp}(V_{\mathbb{Q}},\omega_0)\) and \(\ker N=\mathrm{im}\,N\) is \(\omega_0\)-isotropic.

**Theorem C (restriction, conditional).**  
If \(\omega_{\mathrm{Teth}}\) is alternating, nondegenerate over \(\mathbb{Q}\), and invariant under the monodromy of this family, and if the fibrewise lattice is identified with \(V\), then
\[
\omega_{\mathrm{Teth}}\big|_{V_{\mathbb{Q}}}=\lambda\omega_0
\]
for a unique \(\lambda\in\mathbb{Q}^\times\).

Do **not** print as a theorem: \(X\simeq S^6\); existence of \(\tau,\mu,\beta\); positivity of \(\omega_0(\,\cdot\,,J(z)\,\cdot\,)\); “the tether constructs the fillings.”

---

## 6. What “admits the fill” means in one paragraph (use this wording)

The fillings of the \((3,4,\infty)\) family read a lattice, finite-order automorphisms at the elliptic points, and a rank-two unipotent at the cusp. Those constructions do not require a principal polarization. If a monodromy-invariant alternating form is present, the vanishing plane is isotropic and the logarithm is symplectic. Theorem A says there is only one such form up to scalar on this lattice. A functorial symplectic theory supplies a reason that some pairing exists on a class of tori; Theorem C names that pairing here. That is the fill-admitting role. It organises fibrewise symplectic data. It does not glue \(N_0,N_1,N_2\) and does not prove that the total space is a homology 6-sphere.

---

## 7. Instructions for the LaTeX / Zenodo pass

1. Cite Alpöge for \(T_1,T_2\), \(N\), \(\varepsilon,\varepsilon'\), the period matrix, and the compactification *claims*. Recommended citation line:
   L. Alpöge, *A compact complex threefold fibred by tori over the projective line, and the six-sphere*, self-hosted note announced 23 August 2026, `https://alpo.ge/s6.pdf`.
2. Cite this note for \(\Omega_0\), uniqueness, type \((1,6)\), \(N\in\mathfrak{sp}(\omega_0)\), and Theorem C.
3. Abstract must not mention \(S^6\) as a result of this paper.
4. MSC-style keywords: symplectic lattice, monodromy, triangle group, Pfaffian, complex torus.
5. Deposit only after the statement of Theorem A is reproducible (the twelve residuals plus the solution \(c=d/6\)).
6. If a Lean appendix is attached, `#print axioms` goes in the appendix. Do not claim kernel-checked geometry of \(X\).
7. License: CC-BY-4.0 is the usual Zenodo default and permits Alpöge to be cited rather than absorbed.
8. Author note (Section 8 below) stays in a section titled **Author’s note on priority**. It is not a theorem. It is not the abstract.

---

## 8. Author’s note on priority (first person; not a theorem)

*This section is a statement by the author. It is included so a later compilation does not have to invent a priority paragraph. Editors and readers should treat it as a claim about dates and intended scope, not as evidence that any laboratory’s model weights contain any particular corpus, and not as a substitute for Theorem A.*

I, Benjamin Frohman, record the following for the public file.

Through early 2026 I circulated, under the working name *Frohmanian tether*, a package of invariant symplectic / metriplectic / holographic structure on tori and related categories: a 2-form that is supposed to be natural with respect to morphisms of complex tori and stable under extension of the base field. Dated drafts, repository commits, and public posts exist on my side of that record. The intent of that package was never “produce a diffeomorphism \(X\simeq S^6\).” The intent was a functorial pairing.

On 23 August 2026 L. Alpöge announced a compactification of a \((3,4,\infty)\) family of complex 2-tori and a claim that the total space is diffeomorphic to \(S^6\). The note uses an explicit rank-four lattice representation “in place of the symplectic one.” The present calculation supplies the missing Gram matrix \(\Omega_0\) of type \((1,6)\) and proves it is the unique invariant form. On 27 August 2026 a Lean repository associated with B. Alexeev (`plby/HopfProblem`) was circulated as a formalization of Alpöge’s global claim. That repository addresses a different theorem from Theorem A.

I do not claim that Alpöge’s compactification is a transcription of the tether, and I do not claim that any industrial laboratory published \(\Omega_0\) before this note. I do claim:

- the functorial-form idea I was writing under the tether name is earlier, on my timestamps, than the August 2026 S^6 announcement;
- any monodromy-invariant alternating form on *this* lattice is a scalar times \(\omega_0\), so a tether form, if it applies to this family, cannot be a different pairing;
- credit for the matrices and for the compactification *claim* remains with Alpöge’s note;
- credit for the uniqueness of \(\Omega_0\) and for the restriction lemma is the content of this series.

I also record a suspicion, which I cannot verify from outside a training run: large models in public use in 2026 were trained on internet-visible mathematical text, and some of my earlier public tether writing was internet-visible. That is a remark about possible overlap of *language*, not a proof of derivation, and not an accusation that Alpöge or Alexeev copied a private file. Priority for a *theorem* is settled by dated statements of that theorem, not by the hypothesis that a model saw a related phrase.

Readers who want a justiciable priority record should use: (i) the earliest public URL or commit that contains the tether *statement*, (ii) Alpöge’s 23 August 2026 announcement for the family and the matrices, (iii) this note’s date for \(\Omega_0\) and uniqueness. Those three dates do not collapse into one.

---

## 9. Disclaimer / PSA (print after the author note)

This note does not assert:

- that OpenAI, Anthropic, xAI, or any other laboratory trained a named model on a named Frohman corpus;
- that the HopfProblem Lean file is a transcription of the tether;
- that \(X\simeq S^6\) is proved here;
- that type \((1,6)\) is a defect in Alpöge’s geometry rather than a precise description of his lattice.

This note does assert:

- \(\Omega_0\) is the unique invariant rational alternating form on the published matrices;
- a tether restriction, if the tether applies, equals \(\lambda\omega_0\);
- \(N\) is symplectic for that form and is not itself the form;
- \(\mathrm{Pf}=6\) is the type, not the tether.

If a compiled preprint changes those four sentences, it has left the documentation.

---

## 10. File list for the CLI agent

Compile from, in order:

1. `Omega0_Tether_Bridge_Note.md` — main theorem note, scope lock, bridge lemma.
2. `Omega0_Expanded_Proofs.md` — residuals, solution, pairing checks, dual matrix, \(N\) identity.
3. This file — dictionary, Zenodo rules, author note, disclaimer.

Output: one LaTeX article, article class, amsmath, amsthm, amssymb. Theorems A, B, C only. Author note in an unnumbered section at the end. Bibliography with Alpöge. No abstract sentence that claims a complex structure on \(S^6\).

END.
