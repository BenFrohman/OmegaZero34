# The unique monodromy-invariant alternating form of type (1,6) on Alpöge’s (3,4,∞) lattice, and the restriction of a functorial symplectic structure

**A lattice theorem, a uniqueness theorem, and a precise bridge statement**

Date of the linear-algebra computation: 27 August 2026  
Subject classification (informal): 15A63, 32G20, 14D05, 53D05

---

## Abstract

Let \(V=\mathbb{Z}^4\) carry the representation of the triangle group \(\Delta(3,4,\infty)\) given by the matrices \(T_1,T_2\in\mathrm{SL}(4,\mathbb{Z})\) in Alpöge’s self-hosted note constructing a compactification of a family of complex 2-tori. We determine completely the space of rational alternating bilinear forms on \(V_{\mathbb{Q}}\) that are invariant under \(T_1\) and \(T_2\). That space is one-dimensional. A primitive integral generator is the matrix
\[
\Omega_0=\begin{pmatrix}0&0&0&1\\0&0&6&0\\0&-6&0&0\\-1&0&0&0\end{pmatrix},
\]
of determinant \(36\) and elementary-divisor type \((1,6)\). The unipotent element \(T_0=(T_1T_2)^{-1}\) preserves the same form, and its logarithm \(N=T_0-I\) lies in the symplectic Lie algebra of \(\omega_0\).

Consequently any monodromy-invariant alternating form on this local system — including the restriction of a functorial symplectic 2-form on families of complex 2-tori (the relevant fragment of a Frohmanian tether) — is a unique rational multiple of \(\omega_0\). This is the only identification that can be claimed on the basis of the matrices in the source and the uniqueness theorem. It organises the fibrewise pairing used in vanishing-cycle and unipotent-cusp calculations. It does not construct the compact complex threefold and does not prove that the total space is diffeomorphic to \(S^6\).

---

## 0. Scope and non-claims

This note proves a theorem about a rank-four lattice and two matrices. It then records a *conditional* lemma connecting that theorem to a functorial symplectic form on families of complex tori.

The following are **not** proved here:

- existence of holomorphic period functions \(\tau,\mu,\beta\);
- existence or holomorphicity of Alpöge’s compactification \(X\);
- \(\pi_1(X)=1\) or \(H_*(X;\mathbb{Z})\cong H_*(S^6;\mathbb{Z})\);
- that \(X\) is diffeomorphic to \(S^6\);
- that a named “Frohmanian Tether Theorem” has been kernel-checked in Lean;
- that Alpöge’s construction is incorrect, incomplete, or appropriated.

What *is* proved is that the fibrewise pairing on this particular monodromy representation, if it is alternating and invariant, cannot be anything other than a scalar times \(\omega_0\). That is the bridge. The fillings of the family use vanishing cycles, a unipotent logarithm, and a coinvariant line; those calculations live naturally in the symplectic category of \((V,\omega_0)\). A functorial form supplies a *reason* that some pairing exists before one writes matrices. Uniqueness supplies the *value* of that pairing on this lattice.

---

## 1. The representation

### 1.1 Source data

Let \(V=\mathbb{Z}^4\) with ordered basis \((\gamma,u,w,\delta)\). Alpöge’s note assigns to the standard generators of
\[
\Delta=\Delta(3,4,\infty)=\langle g_1,g_2\mid g_1^3=g_2^4=1\rangle
\]
the matrices
\[
T_1=\begin{pmatrix}
1&0&-6&2\\
0&-1&1&1\\
0&-1&0&1\\
0&0&0&1
\end{pmatrix},\qquad
T_2=\begin{pmatrix}
1&6&0&-3\\
0&0&-1&1\\
0&1&0&0\\
0&0&0&1
\end{pmatrix}.
\]
Write \(\rho_V:\Delta\to\mathrm{GL}(V)\) for the representation with \(g_j\mapsto T_j\). Direct multiplication gives
\[
T_1T_2=\begin{pmatrix}
1&0&0&-1\\
0&1&1&0\\
0&0&1&0\\
0&0&0&1
\end{pmatrix}.
\]
This matrix is unipotent of index two, and its inverse is the integer matrix
\[
T_0:=(T_1T_2)^{-1}=\begin{pmatrix}
1&0&0&1\\
0&1&-1&0\\
0&0&1&0\\
0&0&0&1
\end{pmatrix}.
\]
Set \(N:=T_0-I\). Then
\[
N=\begin{pmatrix}
0&0&0&1\\
0&0&-1&0\\
0&0&0&0\\
0&0&0&0
\end{pmatrix},\qquad N^2=0,
\]
and the action on the basis is
\[
N\gamma=0,\qquad Nu=0,\qquad Nw=-u,\qquad N\delta=\gamma,
\]
which is the action recorded in the source.

### 1.2 Elementary facts

**Proposition 1.1.** \(\det T_1=\det T_2=\det T_0=1\). Hence \(\rho_V\) lands in \(\mathrm{SL}(4,\mathbb{Z})\).

*Proof.* Direct expansion of the four-by-four determinants (or cofactor expansion along the last row of each matrix, which is \((0,0,0,1)\)).

**Proposition 1.2.** \(T_1^3=I\) and \(T_1\neq I\), \(T_1^2\neq I\). \(T_2^4=I\) and \(T_2^k\neq I\) for \(k=1,2,3\). Thus the orders of the generators are exactly \(3\) and \(4\).

*Proof.* Matrix powering over \(\mathbb{Z}\). The identities \(T_1^3=I\) and \(T_2^4=I\) are finite and may be checked entrywise. The proper divisors are excluded by comparing a single off-diagonal entry in each proper power (e.g. \((T_1)_{13}=-6\neq 0\), \((T_1^2)_{13}\neq 0\); \((T_2)_{12}=6\neq 0\), and \(T_2^2\neq I\), \(T_2^3\neq I\) likewise).

**Proposition 1.3.** \(T_0(T_1T_2)=(T_1T_2)T_0=I\) and \(N^2=0\), \(N\neq 0\).

These are the only facts about the representation used below.

### 1.3 Dual action

Let \(\Lambda=V^*\) with dual basis \((\hat\gamma,\hat u,\hat w,\hat\delta)\). The dual representation is
\[
A_j:=(T_j^{-1})^T,\qquad A_0:=(T_0^{-1})^T.
\]
Explicitly
\[
A_1=\begin{pmatrix}1&0&0&0\\6&0&1&0\\-6&-1&-1&0\\-2&1&0&1\end{pmatrix},\quad
A_2=\begin{pmatrix}1&0&0&0\\0&0&-1&0\\-6&1&0&0\\3&0&1&1\end{pmatrix},\quad
A_0=\begin{pmatrix}1&0&0&0\\0&1&0&0\\0&1&1&0\\-1&0&0&1\end{pmatrix}.
\]
The source vectors
\[
\varepsilon=\hat\gamma+2\hat u-4\hat w,\qquad
\varepsilon'=\hat\gamma+3\hat u-3\hat w
\]
satisfy \(A_1\varepsilon=\varepsilon\) and \(A_2\varepsilon'=\varepsilon'\) by direct multiplication. This is recorded for later use with the translation parameters of the fillings; it is not needed to compute \(\Omega_0\).

---

## 2. Alternating forms and invariance

### 2.1 Definitions

A bilinear form \(\omega:V_{\mathbb{Q}}\times V_{\mathbb{Q}}\to\mathbb{Q}\) is *alternating* if \(\omega(x,x)=0\) for all \(x\). In characteristic not \(2\) this is equivalent to \(\omega(x,y)=-\omega(y,x)\). Relative to the ordered basis, \(\omega(x,y)=x^T\Omega y\) for a unique matrix \(\Omega\) with \(\Omega^T=-\Omega\).

The form is *invariant* under \(T\in\mathrm{GL}(V_{\mathbb{Q}})\) if \(\omega(Tx,Ty)=\omega(x,y)\) for all \(x,y\), equivalently
\[
T^T\Omega T=\Omega.
\]
The group of rational automorphisms of \((V_{\mathbb{Q}},\omega)\) is
\[
\mathrm{Sp}(V_{\mathbb{Q}},\omega)=\{g\in\mathrm{SL}(V_{\mathbb{Q}}):g^T\Omega g=\Omega\}
\]
when \(\omega\) is nondegenerate. Nondegeneracy is \(\det\Omega\neq 0\), or equivalently \(\mathrm{Pf}(\Omega)\neq 0\), where for
\[
\Omega=\begin{pmatrix}0&a&b&c\\-a&0&d&e\\-b&-d&0&f\\-c&-e&-f&0\end{pmatrix}
\]
one has the Pfaffian \(\mathrm{Pf}(\Omega)=af-be+cd\) and \(\det\Omega=\mathrm{Pf}(\Omega)^2\).

### 2.2 The parameter space

The space \(\mathcal{A}\) of \(4\times 4\) skew-symmetric matrices over \(\mathbb{Q}\) is six-dimensional, with coordinates \((a,b,c,d,e,f)\) as above.

**Lemma 2.1.** For each fixed \(T\in\mathrm{GL}(4,\mathbb{Q})\), the assignment \(\Omega\mapsto T^T\Omega T-\Omega\) is a linear endomorphism of \(\mathcal{A}\).

*Proof.* Skew-symmetry is preserved: if \(\Omega^T=-\Omega\) then
\[
(T^T\Omega T)^T=T^T\Omega^T T=-T^T\Omega T.
\]
Linearity in \(\Omega\) is immediate.

Invariance under both generators is therefore the single linear condition
\[
\Phi(\Omega):=\bigl(T_1^T\Omega T_1-\Omega,\ T_2^T\Omega T_2-\Omega\bigr)=0
\]
on \(\mathcal{A}\).

---

## 3. The uniqueness theorem

**Theorem 3.1 (Uniqueness and existence).**  
The kernel of \(\Phi:\mathcal{A}\to\mathcal{A}\oplus\mathcal{A}\) is one-dimensional. A basis vector is the class of
\[
\Omega_0=\begin{pmatrix}0&0&0&1\\0&0&6&0\\0&-6&0&0\\-1&0&0&0\end{pmatrix},
\]
corresponding to \((a,b,c,d,e,f)=(0,0,1,6,0,0)\). Equivalently, in the given basis,
\[
\omega_0(\gamma,\delta)=1,\qquad \omega_0(u,w)=6,
\]
and all other unordered pairings of basis vectors vanish.

Every rational alternating form invariant under \(T_1\) and \(T_2\) is of the form \(\lambda\omega_0\) for a unique \(\lambda\in\mathbb{Q}\). The \(\mathbb{Z}\)-module of integral invariant alternating forms is \(\mathbb{Z}\cdot\omega_0\).

Moreover \(\mathrm{Pf}(\Omega_0)=6\) and \(\det\Omega_0=36\neq 0\), so \(\omega_0\) is nondegenerate over \(\mathbb{Q}\).

### 3.1 Determination of the kernel

Write a general element of \(\mathcal{A}\) as \(\Omega(a,b,c,d,e,f)\). The twelve-by-twelve block of entries of \(T_1^T\Omega T_1-\Omega\) and \(T_2^T\Omega T_2-\Omega\) (only six independent entries each, by skew-symmetry) yields a \(12\times 6\) matrix \(A\) over \(\mathbb{Q}\) with
\[
\mathrm{rank}\,A=5,\qquad \dim\ker A=1.
\]
A generator of the kernel over \(\mathbb{Q}\) is
\[
(a,b,c,d,e,f)=\bigl(0,0,\tfrac16,1,0,0\bigr).
\]
Clearing the denominator produces the primitive integral vector \((0,0,1,6,0,0)\), i.e. \(\Omega_0\).

(The rank computation is exact linear algebra over \(\mathbb{Q}\). It can be reproduced by forming the \(32\times 6\) matrix of all entries of the two residuals and row-reducing; the same one-dimensional kernel appears.)

### 3.2 Direct verification of invariance

It is not enough to trust a kernel computation. We check \(T_i^T\Omega_0 T_i=\Omega_0\) by evaluating pairings on images of basis vectors.

**Images under \(T_1\).**
\[
T_1\gamma=\gamma,\quad
T_1u=-u-w,\quad
T_1w=-6\gamma+u,\quad
T_1\delta=2\gamma+u+w+\delta.
\]

Then
\[
\omega_0(T_1\gamma,T_1\delta)=\omega_0(\gamma,2\gamma+u+w+\delta)=\omega_0(\gamma,\delta)=1,
\]
since \(\omega_0(\gamma,\gamma)=\omega_0(\gamma,u)=\omega_0(\gamma,w)=0\). Next
\begin{align*}
\omega_0(T_1u,T_1w)
&=\omega_0(-u-w,-6\gamma+u)\\
&=\omega_0(-u,-6\gamma)+\omega_0(-u,u)+\omega_0(-w,-6\gamma)+\omega_0(-w,u).
\end{align*}
The first three summands vanish (\(\omega_0(u,\gamma)=\omega_0(u,u)=\omega_0(w,\gamma)=0\)). The last is
\[
\omega_0(-w,u)=\omega_0(u,w)=6.
\]
The remaining pairings \(\omega_0(T_1\gamma,T_1u)\), \(\omega_0(T_1\gamma,T_1w)\), \(\omega_0(T_1u,T_1\delta)\), \(\omega_0(T_1w,T_1\delta)\) are computed the same way and reproduce the original matrix \(\Omega_0\). Thus \(T_1^T\Omega_0 T_1=\Omega_0\).

**Images under \(T_2\).**
\[
T_2\gamma=\gamma,\quad
T_2u=6\gamma+w,\quad
T_2w=-u,\quad
T_2\delta=-3\gamma+u+\delta.
\]
Then
\[
\omega_0(T_2\gamma,T_2\delta)=\omega_0(\gamma,-3\gamma+u+\delta)=\omega_0(\gamma,\delta)=1,
\]
\[
\omega_0(T_2u,T_2w)=\omega_0(6\gamma+w,-u)=\omega_0(w,-u)=\omega_0(u,w)=6.
\]
The remaining pairings match \(\Omega_0\). Thus \(T_2^T\Omega_0 T_2=\Omega_0\).

**Invariance under \(T_0\).** Since \(T_0\) is a word in \(T_1,T_2\) and both preserve \(\omega_0\), so does \(T_0\). Direct multiplication \(T_0^T\Omega_0 T_0=\Omega_0\) confirms it.

### 3.3 Nondegeneracy

\(\mathrm{Pf}(\Omega_0)=af-be+cd=1\cdot 6=6\), hence \(\det\Omega_0=36\neq 0\). The left kernel of \(\omega_0\) on \(V_{\mathbb{Q}}\) is zero.

### 3.4 Integrality

If \(\Psi\in\mathrm{M}_4(\mathbb{Z})\) is skew and invariant, then \(\Psi=\lambda\Omega_0\) over \(\mathbb{Q}\) by Theorem 3.1. Comparing the \((1,4)\)-entry gives \(\lambda=\Psi_{14}\in\mathbb{Z}\). Hence \(\Psi\in\mathbb{Z}\cdot\Omega_0\).

---

## 4. Type, dual form, and the unipotent logarithm

### 4.1 Elementary divisors

A nondegenerate alternating form on a free \(\mathbb{Z}\)-module of rank \(4\) is equivalent, after an automorphism of the module, to
\[
\begin{pmatrix}0&d_1\\-d_1&0\end{pmatrix}\oplus\begin{pmatrix}0&d_2\\-d_2&0\end{pmatrix},\qquad d_1\mid d_2,\quad d_i>0.
\]
In the ordered basis \((\gamma,\delta,u,w)\) the form \(\omega_0\) is already
\[
\begin{pmatrix}0&1\\-1&0\end{pmatrix}\oplus\begin{pmatrix}0&6\\-6&0\end{pmatrix}.
\]
Thus the type is \((d_1,d_2)=(1,6)\). In particular \(\omega_0\) is **not** unimodular: it is not equivalent over \(\mathrm{GL}(4,\mathbb{Z})\) to the standard symplectic form of type \((1,1)\).

This is the precise lattice-level reading of the source sentence that the construction uses “this rank-four lattice representation **in place of the symplectic one**.” The representation is symplectic over \(\mathbb{Q}\). It is not the Siegel modular embedding attached to a principal polarization.

### 4.2 Dual form

Over \(\mathbb{Q}\), \(\Omega_0^{-1}\) represents the dual pairing on \(V^*\). Because \(\det\Omega_0=36\), the dual pairing is not integral on \(\Lambda=V^*\). The primitive integral matrix in the dual ray is \(36\Omega_0^{-1}=\mathrm{adj}(\Omega_0)\). The dual action \(A_j\) preserves the dual form because \(T_j\) preserves \(\omega_0\).

### 4.3 Reduction modulo \(2\) and \(3\)

For \(p\in\{2,3\}\) one has \(6\equiv 0\pmod{p}\), so
\[
\omega_0\otimes\mathbb{F}_p
\]
is degenerate. Its kernel is two-dimensional, spanned by the reductions of \(u\) and \(w\). The plane \(\mathrm{span}\{\gamma,\delta\}\) remains nondegenerate modulo \(p\).

### 4.4 The unipotent logarithm is symplectic

**Proposition 4.1.** \(N^T\Omega_0+\Omega_0 N=0\). Equivalently,
\[
\omega_0(Nx,y)+\omega_0(x,Ny)=0\qquad\text{for all }x,y.
\]
Thus \(N\in\mathfrak{sp}(V_{\mathbb{Q}},\omega_0)\).

*Proof.* This is the derivative at \(t=0\) of the curve \(t\mapsto (I+tN)^T\Omega_0(I+tN)\) together with \(N^2=0\) and invariance of \(\Omega_0\) under \(T_0=I+N\). It can also be checked by multiplying the explicit matrices.

**Proposition 4.2.** \(\ker N=\mathrm{im}\,N=\mathrm{span}_{\mathbb{Z}}\{\gamma,u\}\), and this plane is \(\omega_0\)-isotropic:
\[
\omega_0(\gamma,u)=0.
\]

*Proof.* The first assertion is the explicit matrix of \(N\). The second is the \((1,2)\)-entry of \(\Omega_0\).

This is the lattice picture of a rank-two unipotent cusp in a symplectic local system: the vanishing plane is isotropic of dimension half the rank, and \(N\) is a nilpotent in the symplectic Lie algebra.

---

## 5. What the compactification uses from this lattice

Alpöge’s construction, as written, uses the representation in four geometric roles.

1. **Varying complex structure on the fibres.** The period matrix \(\Pi(z)\) presents each fibre as \(\mathbb{C}^2/\Pi(z)\Lambda\). This requires a complex structure on \(V_{\mathbb{R}}\), not a symplectic form. A compatible symplectic form is additional data.

2. **Monodromy of \(H_1\).** Parallel transport around loops in \(B^\circ\) acts by \(A_1,A_2,A_0\) on \(\Lambda\). This is the representation already studied.

3. **Cusp filling.** The unipotent \(T_0=I+N\) with \(N^2=0\) and \(\mathrm{rank}\,N=2\) determines Mumford’s toric degeneration and the central fibre \(W\) (glued \(\mathrm{dP}_6\)). The isotropic plane \(\ker N\) is the lattice of vanishing cycles.

4. **Coinvariants and \(\pi_1\).** The source computes
   \[
   \pi_1(X)\cong\mathbb{Z}/|12\ell_0-4\ell_1-3\ell_2|
   \]
   from translation parameters and a linear functional \(\gamma\) detecting the coinvariants of \(\Lambda\). That computation is integer arithmetic on the lattice, organised by the monodromy, not by a choice of Hermitian metric.

Items 3 and 4 take place in a linear category. If that category is symplectic, the vanishing plane is automatically isotropic, the logarithm automatically lies in \(\mathfrak{sp}\), and the pairing on the complementary plane is a well-defined invariant of the local system. Theorem 3.1 says there is only one such pairing up to scalar: \(\omega_0\).

That is the sense in which a symplectic form “admits the fill.” It does not construct \(W\) or the logarithmic transforms. It puts the lattice data those fillings read into a unique symplectic slot.

---

## 6. The tether fragment, stated as hypotheses

A carefully stated relevant fragment of a Frohmanian tether, for the present purpose only, is the following package of hypotheses on a category \(\mathcal{C}\) of complex 2-tori (or polarized rank-four lattices) that includes the fibres of Alpöge’s family and their monodromy.

**Hypothesis H1 (existence).** There is, for each object \(T\in\mathcal{C}\), an alternating form \(\omega_{\mathrm{Teth}}(T)\) on \(H_1(T,\mathbb{Z})\otimes\mathbb{Q}\).

**Hypothesis H2 (nondegeneracy).** \(\omega_{\mathrm{Teth}}(T)\) is nondegenerate over \(\mathbb{Q}\).

**Hypothesis H3 (monodromy / functoriality on morphisms).** For every morphism \(f:T\to T'\) in \(\mathcal{C}\) induced by monodromy or by an isomorphism of complex tori,
\[
f^*\omega_{\mathrm{Teth}}(T')=\omega_{\mathrm{Teth}}(T).
\]
In particular, if \(T\to B^\circ\) is a family and \(\rho:\pi_1(B^\circ,b)\to\mathrm{Aut}(H_1(T_b,\mathbb{Z}))\) is the monodromy representation, then \(\rho(\pi_1)\) preserves \(\omega_{\mathrm{Teth}}(T_b)\).

**Hypothesis H4 (stability under field extension).** If \(K\subset L\) is an extension of the base field appearing in the linear algebra of the local system, the form after extension of scalars is the extension of the original form.

These are hypotheses, not theorems of this note. They are the interface. Anything called a tether theorem in another manuscript may be used here only insofar as it implies H1–H4 for this family.

A complex 2-torus always admits *some* compatible symplectic form (the imaginary part of a positive Hermitian form). That classical fact is weaker than H3–H4: it does not by itself force the form to be constant in a family, nor unique up to scalar on a given local system. Uniqueness on *this* local system is Theorem 3.1, which does not need the tether. Existence of a form that is functorial in a larger category is what the tether is being asked to supply.

---

## 7. The bridge lemma

**Theorem 7.1 (Restriction).**  
Assume H1–H3 for the family of complex 2-tori in Alpöge’s note, and assume the identification of the fibrewise first homology lattice with the module \(V=\mathbb{Z}^4\) of §1. Then there exists a unique \(\lambda\in\mathbb{Q}^\times\) such that
\[
\omega_{\mathrm{Teth}}\big|_{V_{\mathbb{Q}}}=\lambda\,\omega_0.
\]
If H1 produces an integral pairing, then \(\lambda\in\mathbb{Z}\setminus\{0\}\) and the restriction is an integer multiple of \(\omega_0\).

*Proof.* By H3 the restriction \(\psi:=\omega_{\mathrm{Teth}}|_V\) is alternating (H1) and invariant under \(T_1\) and \(T_2\). By Theorem 3.1, \(\psi=\lambda\omega_0\) for a unique \(\lambda\in\mathbb{Q}\). By H2 one has \(\lambda\neq 0\). The integral clause is §3.4.

**Corollary 7.2.** Under the same hypotheses, the monodromy representation lands in
\[
\mathrm{Aut}(V,\omega_0)=\{g\in\mathrm{SL}(V_{\mathbb{Q}}):g^T\Omega_0 g=\Omega_0\}
\]
for categorical reasons (H3) rather than by an a-posteriori matrix check. The a-posteriori check has nevertheless been carried out: it is Theorem 3.1.

**Corollary 7.3.** The unipotent logarithm \(N\) of the cusp monodromy satisfies \(N\in\mathfrak{sp}(\omega_0)\), and the vanishing plane \(\ker N\) is \(\omega_0\)-isotropic. These are the linear-algebraic inputs of a Mumford-type cusp filling, stated in the unique symplectic structure available on this lattice.

### 7.1 What “admits the fill” means

The phrase is used here in one meaning only.

The fillings \(N_0,N_1,N_2\) in the source are standard constructions attached to finite-order and unipotent automorphisms of a complex 2-torus. Those constructions read:

- a lattice,
- a complex structure on the real torus (period matrix),
- an automorphism of finite order (elliptic points) or a unipotent automorphism of rank two (cusp),
- translation parameters in the lattice.

They do not require a principal polarization. They do use that the automorphism preserves the complex structure, and the cusp calculation uses a two-dimensional vanishing plane.

If one also has a monodromy-invariant alternating form, then:

- the vanishing plane is isotropic rather than an arbitrary rank-two submodule;
- the logarithm is symplectic rather than an arbitrary nilpotent;
- the complementary pairing \(\omega_0(u,w)=6\) is an invariant of the local system, not a coordinate artefact;
- after any extension of scalars appearing in a formalization, the same form remains the unique invariant pairing (H4 plus uniqueness).

That is the fill-admitting role of the form. It is organisation of the fibrewise symplectic data. It is not a construction of \(X\) and not a proof that \(X\simeq S^6\).

### 7.2 What the tether adds beyond \(\omega_0\)

Theorem 3.1 already produces \(\omega_0\) from the matrices, with no tether. The tether, if H1–H4 hold, adds:

1. a *source* of a form that is defined for a class of tori, not just for this representation;
2. a reason the form is the same after base change, so linear-algebraic computations in a function field or in Lean after extending scalars remain referring to the same pairing;
3. the Restriction Lemma, which converts that abstract form into the concrete matrix \(\Omega_0\) on this example.

Without H1–H4, \(\omega_0\) is still the unique invariant form on this lattice. The tether is not needed to *find* \(\Omega_0\). It is a proposed explanation of *why a form should exist in a family* and *why it should be the same form after extension of scalars*. On this example, uniqueness then names it.

### 7.3 Compatibility with a complex structure

Let \(J\) be the complex structure on \(V_{\mathbb{R}}\) determined by a period matrix \(\Pi(z)\). A symplectic form \(\omega\) is compatible with \(J\) in the usual sense if \(\omega(\,\cdot\,,J\,\cdot\,)\) is symmetric and positive definite. Theorem 3.1 does not address positivity. Whether \(\lambda\omega_0\) is compatible with the varying \(J(z)\) of Alpöge’s period map is a separate analytic question, depending on the sign of \(\lambda\) and on the functions \(\tau,\mu,\beta\). That question is not settled here. The bridge lemma only identifies the *alternating* monodromy-invariant pairing.

---

## 8. Dual-lattice invariants used by the fillings

The source works primarily on \(\Lambda=V^*\). The following facts sit on the dual side and are compatible with \(\omega_0\).

**Proposition 8.1.** \(A_1\varepsilon=\varepsilon\) and \(A_2\varepsilon'=\varepsilon'\), with \(\varepsilon,\varepsilon'\) as in §1.3.

**Proposition 8.2.** The plane \(\mathrm{span}\{\hat w,\hat\delta\}\) is the source’s \(\Lambda_{\mathrm{tor}}\). Under the identification by \(\omega_0\), this plane is dual to \(\mathrm{span}\{u,\gamma\}\) up to the factor \(6\) on the \((u,w)\)-pairing. The cusp text treats \(\hat w,\hat\delta\) as vanishing cycles; Proposition 4.2 is the corresponding statement on \(V\).

**Proposition 8.3.** The integer
\[
p(\ell_0,\ell_1,\ell_2)=|12\ell_0-4\ell_1-3\ell_2|
\]
is the Orlik–Seifert-type quantity appearing in the source \(\pi_1\) formula. For the chosen filling \((\ell_0,\ell_1,\ell_2)=(0,1,-1)\) one has \(p=1\). This identity is elementary and independent of \(\omega_0\). What \(\omega_0\) supplies is not the value \(1\); it supplies a symplectic home for the coinvariant line.

---

## 9. Lean specification of the proved part

The following statements are finite and suitable for a sorry-free Lean 4 development against Mathlib, with at most disclosed `native_decide` for \(4\times 4\) integer arithmetic.

```
T1, T2, T0, N            as in §1
det T1 = det T2 = det T0 = 1
T1^3 = 1, T2^4 = 1
N^2 = 0
Ω0                       as in Theorem 3.1
Ω0ᵀ = -Ω0
Ω0.det = 36
T1ᵀ * Ω0 * T1 = Ω0
T2ᵀ * Ω0 * T2 = Ω0
T0ᵀ * Ω0 * T0 = Ω0
Nᵀ * Ω0 + Ω0 * N = 0
```

Uniqueness over \(\mathbb{Q}\) is the six-parameter argument of §3.1. Hypotheses H1–H4 belong in a separate interface file and must not be presented as proved by the kernel unless a separate development proves them.

A formalization of Theorem 7.1 is a proof that
\[
\text{H1}+\text{H2}+\text{H3}+\text{Theorem 3.1}\ \Rightarrow\ \text{restriction equals }\lambda\omega_0.
\]
That implication is one line once uniqueness is available. It is not a formalization of \(X\simeq S^6\).

---

## 10. Relation to other public formalizations

As of 27 August 2026 there exist public attempts to formalize Alpöge’s *global* claim that the compactification is a complex structure on \(S^6\) (notably developments packaged around the Hopf problem). Those attempts, whatever their kernel status, address Theorem A of the source (existence of \(X\) and the diffeomorphism type). They do not replace Theorem 3.1, and Theorem 3.1 does not replace them.

If a Hopf-problem Lean file typechecks a statement
\[
\exists\ \text{a complex manifold structure on }S^6,
\]
the kernel has checked that statement, not the existence of a tether and not the matrix \(\Omega_0\). Conversely, a kernel check of \(\Omega_0\) does not imply the Hopf statement.

---

## 11. Summary of what is now on the table

**Proved.**

- \(T_1,T_2,T_0\in\mathrm{SL}(4,\mathbb{Z})\) with the stated orders and unipotence.
- The space of monodromy-invariant rational alternating forms on this lattice is \(\mathbb{Q}\cdot\omega_0\).
- \(\Omega_0\) is an explicit primitive integral generator, type \((1,6)\), determinant \(36\).
- \(N\in\mathfrak{sp}(\omega_0)\) and \(\ker N\) is isotropic.
- Dual fixed vectors \(\varepsilon,\varepsilon'\) match the source.

**Conditional on H1–H3.**

- Restriction of a tether form to this lattice equals \(\lambda\omega_0\).
- Monodromy lands in \(\mathrm{Aut}(V,\omega_0)\) for functorial reasons, with the same concrete form.

**Not proved.**

- The compactification theorem.
- Compatibility of \(\lambda\omega_0\) with the varying complex structure \(J(z)\).
- Any priority claim that a tether manuscript already constructed \(X\).

The object that was missing from the public matrices is \(\Omega_0\). The object a functorial symplectic theory can attach to those matrices, and only that object, is a scalar multiple of \(\omega_0\). That is the bridge. The fillings read the lattice through that pairing. They are not thereby constructed.

---

## Appendix A. The matrix \(\Omega_0\) for transcription

```
Ω0 = [[  0,  0,  0,  1],
      [  0,  0,  6,  0],
      [  0, -6,  0,  0],
      [ -1,  0,  0,  0]]
```

Pairings: \(\omega_0(\gamma,\delta)=1\), \(\omega_0(u,w)=6\).

Pfaffian \(6\). Determinant \(36\). Type \((1,6)\).

## Appendix B. Source attribution

Matrices \(T_1,T_2\), the description of \(N\), the dual vectors \(\varepsilon,\varepsilon'\), the period matrix \(\Pi(z)\), and the compactification claims are taken from L. Alpöge, self-hosted note announced 23 August 2026, `alpo.ge/s6.pdf`. The computation of \(\ker\Phi\) and the matrix \(\Omega_0\) are the content of this note. The restriction lemma is the only stated interface with a functorial symplectic / tether theory.

END OF NOTE.
