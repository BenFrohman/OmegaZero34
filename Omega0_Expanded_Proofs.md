# Expanded proofs of the \(\Omega_0\) theorems

This addendum replaces any appeal to “computer algebra / rank 5” with the explicit linear system and entrywise identities. Notation is that of `Omega0_Tether_Bridge_Note.md`. Vectors are columns. Indices on matrices are \(1\)-based in the order \((\gamma,u,w,\delta)\).

---

## A. Parametrization

A general element of the six-dimensional space \(\mathcal{A}\) of \(4\times 4\) skew-symmetric matrices over \(\mathbb{Q}\) is
\[
\Omega=\begin{pmatrix}
0&a&b&c\\
-a&0&d&e\\
-b&-d&0&f\\
-c&-e&-f&0
\end{pmatrix}.
\]
The associated form is \(\omega(x,y)=x^T\Omega y\). The six coordinates are the independent pairings
\[
\begin{align*}
a&=\omega(\gamma,u),&
b&=\omega(\gamma,w),&
c&=\omega(\gamma,\delta),\\
d&=\omega(u,w),&
e&=\omega(u,\delta),&
f&=\omega(w,\delta).
\end{align*}
\]

Invariance under \(T\) is \(T^T\Omega T=\Omega\), or equivalently \(\omega(Tx,Ty)=\omega(x,y)\) on all pairs of basis vectors. Because both sides are skew, it is enough to impose equality on the six pairs
\[
(\gamma,u),\ (\gamma,w),\ (\gamma,\delta),\ (u,w),\ (u,\delta),\ (w,\delta).
\]

---

## B. Residual of \(T_1\)

**Lemma B.1.** For general \(\Omega\) as above,
\[
T_1^T\Omega T_1-\Omega
\]
has independent upper-triangular entries
\begin{align*}
(1,2)&:\quad -2a-b,\\
(1,3)&:\quad a-b,\\
(1,4)&:\quad a+b,\\
(2,3)&:\quad -6(a+b),\\
(2,4)&:\quad 2a+2b-2e-f,\\
(3,4)&:\quad -8a-6b-6c+d+e-f.
\end{align*}

*Derivation of the first three from pairings.* The columns of \(T_1\) are
\[
T_1\gamma=\gamma,\qquad
T_1u=-u-w,\qquad
T_1w=-6\gamma+u,\qquad
T_1\delta=2\gamma+u+w+\delta.
\]

\((1,2)\). We need \(\omega(T_1\gamma,T_1u)=\omega(\gamma,u)\).
\[
\omega(\gamma,-u-w)=-\omega(\gamma,u)-\omega(\gamma,w)=-a-b.
\]
The residual pairing is
\[
(-a-b)-a=-2a-b.
\]

\((1,3)\). \(\omega(T_1\gamma,T_1w)=\omega(\gamma,-6\gamma+u)=\omega(\gamma,u)=a\),
so the residual is \(a-b\).

\((1,4)\).
\[
\omega(\gamma,2\gamma+u+w+\delta)=\omega(\gamma,u)+\omega(\gamma,w)+\omega(\gamma,\delta)=a+b+c.
\]
Residual: \((a+b+c)-c=a+b\).

\((2,3)\).
\begin{align*}
\omega(T_1u,T_1w)
&=\omega(-u-w,-6\gamma+u)\\
&=6\omega(u,\gamma)-\omega(u,u)+6\omega(w,\gamma)-\omega(w,u)\\
&=6(-a)+0+6(-b)-(-d)\\
&=-6a-6b+d.
\end{align*}
Residual: \((-6a-6b+d)-d=-6(a+b)\).

\((2,4)\).
\begin{align*}
\omega(T_1u,T_1\delta)
&=\omega(-u-w,\ 2\gamma+u+w+\delta)\\
&=-2\omega(u,\gamma)-\omega(u,u)-\omega(u,w)-\omega(u,\delta)\\
&\quad-2\omega(w,\gamma)-\omega(w,u)-\omega(w,w)-\omega(w,\delta)\\
&=-2(-a)-0-d-e-2(-b)-(-d)-0-f\\
&=2a+2b-e-f.
\end{align*}
(The \(-\omega(u,w)-\omega(w,u)=-d+d=0\) cancelled.) Residual:
\[
(2a+2b-e-f)-e=2a+2b-2e-f.
\]

\((3,4)\).
\begin{align*}
\omega(T_1w,T_1\delta)
&=\omega(-6\gamma+u,\ 2\gamma+u+w+\delta)\\
&=-12\omega(\gamma,\gamma)-6\omega(\gamma,u)-6\omega(\gamma,w)-6\omega(\gamma,\delta)\\
&\quad+2\omega(u,\gamma)+\omega(u,u)+\omega(u,w)+\omega(u,\delta)\\
&=0-6a-6b-6c+2(-a)+0+d+e\\
&=-8a-6b-6c+d+e.
\end{align*}
Residual: \((-8a-6b-6c+d+e)-f\).

Setting these six residuals to zero is equivalent to \(T_1^T\Omega T_1=\Omega\).

---

## C. Residual of \(T_2\)

**Lemma C.1.** The independent upper-triangular entries of \(T_2^T\Omega T_2-\Omega\) are
\begin{align*}
(1,2)&:\quad -a+b,\\
(1,3)&:\quad -a-b,\\
(1,4)&:\quad a,\\
(2,3)&:\quad -6a,\\
(2,4)&:\quad 6a+3b+6c-d-e+f,\\
(3,4)&:\quad -3a-e-f.
\end{align*}

*Derivation.* Columns of \(T_2\):
\[
T_2\gamma=\gamma,\qquad
T_2u=6\gamma+w,\qquad
T_2w=-u,\qquad
T_2\delta=-3\gamma+u+\delta.
\]

\((1,2)\). \(\omega(\gamma,6\gamma+w)=\omega(\gamma,w)=b\). Residual \(b-a=-a+b\).

\((1,3)\). \(\omega(\gamma,-u)=-a\). Residual \(-a-b\).

\((1,4)\). \(\omega(\gamma,-3\gamma+u+\delta)=\omega(\gamma,u)+\omega(\gamma,\delta)=a+c\). Residual \(a\).

\((2,3)\). \(\omega(6\gamma+w,-u)=-6\omega(\gamma,u)-\omega(w,u)=-6a+d\). Residual \(-6a\).

\((2,4)\).
\begin{align*}
\omega(6\gamma+w,-3\gamma+u+\delta)
&=-18\omega(\gamma,\gamma)+6\omega(\gamma,u)+6\omega(\gamma,\delta)\\
&\quad-3\omega(w,\gamma)+\omega(w,u)+\omega(w,\delta)\\
&=6a+6c-3(-b)+(-d)+f\\
&=6a+3b+6c-d+f.
\end{align*}
Residual: \((6a+3b+6c-d+f)-e\).

\((3,4)\).
\[
\omega(-u,-3\gamma+u+\delta)=3\omega(u,\gamma)-\omega(u,u)-\omega(u,\delta)=3(-a)-e=-3a-e.
\]
Residual: \(-3a-e-f\).

---

## D. Solution of the linear system

**Proposition D.1.** The twelve residual entries of Lemmas B.1 and C.1 vanish if and only if
\[
a=b=e=f=0\qquad\text{and}\qquad c=\frac{d}{6}.
\]

*Proof.* From \(T_2\)'s \((1,4)\)-residual one has \(a=0\).  
From \(T_2\)'s \((1,2)\)-residual, \(-a+b=0\) and \(a=0\) give \(b=0\).  
From \(T_2\)'s \((1,3)\)-residual, \(-a-b=0\) is then automatic.  
From \(T_2\)'s \((2,3)\)-residual, \(-6a=0\) is automatic.  
From \(T_2\)'s \((3,4)\)-residual, \(-3a-e-f=0\) becomes \(e+f=0\).  

From \(T_1\)'s \((1,2)\), \((1,3)\), \((1,4)\): each of \(-2a-b\), \(a-b\), \(a+b\) vanishes once \(a=b=0\).  
From \(T_1\)'s \((2,3)\): \(-6(a+b)=0\) is automatic.  
From \(T_1\)'s \((2,4)\): \(2a+2b-2e-f=0\) becomes \(-2e-f=0\).  
Together with \(e+f=0\) one gets \(f=-e\) and \(-2e-(-e)=0\), i.e. \(-e=0\), hence \(e=0\) and \(f=0\).

The two remaining equations are the \((3,4)\) residual of \(T_1\) and the \((2,4)\) residual of \(T_2\). With \(a=b=e=f=0\) they collapse to
\[
-6c+d=0,\qquad 6c-d=0,
\]
which are the same condition \(d=6c\).

The solution space is therefore one-dimensional, parametrized by \(d\in\mathbb{Q}\) with
\[
(a,b,c,d,e,f)=\bigl(0,0,d/6,d,0,0\bigr).
\]
Taking \(d=6\) produces the primitive integral matrix \(\Omega_0\). Taking \(d=1\) produces \(\Omega_0/6\). Every rational solution is \(\lambda\Omega_0\) with \(\lambda=d/6\).

**Corollary D.2 (uniqueness).** If \(\Psi\) is any rational skew matrix with \(T_1^T\Psi T_1=\Psi=T_2^T\Psi T_2\), then \(\Psi=\lambda\Omega_0\) for a unique \(\lambda\in\mathbb{Q}\). If \(\Psi\) is integral then \(\lambda\in\mathbb{Z}\), because the \((1,4)\)-entry of \(\Omega_0\) is \(1\) and the \((1,4)\)-entry of \(\Psi\) equals \(\lambda\).

---

## E. Direct check that \(\Omega_0\) itself works

Now specialize to
\[
a=b=e=f=0,\quad c=1,\quad d=6,
\]
i.e. the only nonzero basis pairings \(\omega_0(\gamma,\delta)=1\) and \(\omega_0(u,w)=6\).

**Under \(T_1\).**
\begin{align*}
\omega_0(T_1\gamma,T_1u)&=\omega_0(\gamma,-u-w)=0=\omega_0(\gamma,u),\\
\omega_0(T_1\gamma,T_1w)&=\omega_0(\gamma,-6\gamma+u)=0=\omega_0(\gamma,w),\\
\omega_0(T_1\gamma,T_1\delta)&=\omega_0(\gamma,2\gamma+u+w+\delta)=\omega_0(\gamma,\delta)=1,\\
\omega_0(T_1u,T_1w)&=\omega_0(-u-w,-6\gamma+u)=\omega_0(-w,u)=\omega_0(u,w)=6,\\
\omega_0(T_1u,T_1\delta)&=\omega_0(-u-w,2\gamma+u+w+\delta)\\
&=\omega_0(-u,w)+\omega_0(-w,u)+\omega_0(-u,\delta)+\omega_0(-w,\delta)\\
&=-6+6+0+0=0=\omega_0(u,\delta),\\
\omega_0(T_1w,T_1\delta)&=\omega_0(-6\gamma+u,2\gamma+u+w+\delta)\\
&=\omega_0(-6\gamma,\delta)+\omega_0(u,w)=-6\cdot 1+6=0=\omega_0(w,\delta).
\end{align*}

**Under \(T_2\).**
\begin{align*}
\omega_0(T_2\gamma,T_2u)&=\omega_0(\gamma,6\gamma+w)=0,\\
\omega_0(T_2\gamma,T_2w)&=\omega_0(\gamma,-u)=0,\\
\omega_0(T_2\gamma,T_2\delta)&=\omega_0(\gamma,-3\gamma+u+\delta)=1,\\
\omega_0(T_2u,T_2w)&=\omega_0(6\gamma+w,-u)=\omega_0(w,-u)=6,\\
\omega_0(T_2u,T_2\delta)&=\omega_0(6\gamma+w,-3\gamma+u+\delta)\\
&=\omega_0(6\gamma,\delta)+\omega_0(w,u)=6-6=0,\\
\omega_0(T_2w,T_2\delta)&=\omega_0(-u,-3\gamma+u+\delta)=0.
\end{align*}

**Under \(T_0=I+N\).** Columns:
\[
T_0\gamma=\gamma,\quad T_0u=u,\quad T_0w=-u+w,\quad T_0\delta=\gamma+\delta.
\]
\begin{align*}
\omega_0(T_0\gamma,T_0\delta)&=\omega_0(\gamma,\gamma+\delta)=1,\\
\omega_0(T_0u,T_0w)&=\omega_0(u,-u+w)=6,\\
\omega_0(T_0\gamma,T_0u)&=\omega_0(T_0\gamma,T_0w)=\omega_0(T_0u,T_0\delta)=\omega_0(T_0w,T_0\delta)=0.
\end{align*}

---

## F. Determinant, Pfaffian, type

For a general element of \(\mathcal{A}\),
\[
\mathrm{Pf}(\Omega)=af-be+cd.
\]
On \(\Omega_0\) this is \(0-0+1\cdot 6=6\), so
\[
\det\Omega_0=\mathrm{Pf}(\Omega_0)^2=36\neq 0.
\]
Hence \(\omega_0\) is nondegenerate over \(\mathbb{Q}\).

In the ordered basis \((\gamma,\delta,u,w)\) the Gram matrix of \(\omega_0\) is block diagonal
\[
\begin{pmatrix}0&1\\-1&0\end{pmatrix}\oplus\begin{pmatrix}0&6\\-6&0\end{pmatrix}.
\]
The elementary divisors of a nondegenerate alternating form on \(\mathbb{Z}^4\) are a pair \((d_1,d_2)\) with \(d_1\mid d_2\). Here \((d_1,d_2)=(1,6)\). The form is therefore not equivalent over \(\mathrm{GL}(4,\mathbb{Z})\) to the standard unimodular form of type \((1,1)\).

The inverse over \(\mathbb{Q}\) is
\[
\Omega_0^{-1}=\begin{pmatrix}
0&0&0&-1\\
0&0&-1/6&0\\
0&1/6&0&0\\
1&0&0&0
\end{pmatrix},
\]
and the adjugate (primitive integral dual matrix) is
\[
\mathrm{adj}(\Omega_0)=36\Omega_0^{-1}=\begin{pmatrix}
0&0&0&-36\\
0&0&-6&0\\
0&6&0&0\\
36&0&0&0
\end{pmatrix}.
\]

---

## G. The infinitesimal symplectic identity

**Proposition G.1.** \(N^T\Omega_0+\Omega_0 N=0\).

*Proof by matrix multiplication.* Let
\[
N=\begin{pmatrix}0&0&0&1\\0&0&-1&0\\0&0&0&0\\0&0&0&0\end{pmatrix}.
\]
Row-by-column,
\[
\Omega_0 N=\begin{pmatrix}0&0&0&0\\0&0&0&0\\0&0&6&0\\0&0&0&-1\end{pmatrix},\qquad
N^T\Omega_0=\begin{pmatrix}0&0&0&0\\0&0&0&0\\0&0&-6&0\\0&0&0&1\end{pmatrix},
\]
because \(N^T(x_0,x_1,x_2,x_3)=(0,0,-x_1,x_0)\) and the columns of \(\Omega_0\) are \(-e_4\), \(-6e_3\), \(6e_2\), \(e_1\). Adding these two matrices gives \(0\).

**Pairing proof.** It is enough to check \(\omega_0(Nx,y)+\omega_0(x,Ny)=0\) on basis pairs. Here \(N\gamma=Nu=0\), \(Nw=-u\), \(N\delta=\gamma\).

- \((\gamma,\delta)\): \(\omega_0(0,\delta)+\omega_0(\gamma,\gamma)=0\).
- \((u,w)\): \(\omega_0(0,w)+\omega_0(u,-u)=0\).
- \((w,\delta)\): \(\omega_0(-u,\delta)+\omega_0(w,\gamma)=0\).
- \((u,\delta)\): \(\omega_0(0,\delta)+\omega_0(u,\gamma)=0\).
- \((\gamma,u)\) and \((\gamma,w)\): \(N\gamma=0\) and \(\omega_0(\gamma,-u)=0\).

The remaining pairs follow by skew-symmetry.

**Kernel and image.** \(\ker N=\mathrm{span}\{\gamma,u\}=\mathrm{im}\,N\), and \(\omega_0(\gamma,u)=0\), so the plane is isotropic.

---

## H. Restriction lemma, written out

Assume \(\psi\) is an alternating form on \(V_{\mathbb{Q}}\) with \(T_1^*\psi=\psi=T_2^*\psi\) (e.g. the restriction of a monodromy-invariant tether form). Write \(\psi(x,y)=x^T\Psi y\) with \(\Psi\) skew. Then \(\Psi\) satisfies the twelve residual equations of §§B–C, hence by Proposition D.1
\[
\Psi=\lambda\Omega_0,\qquad\lambda=\Psi_{14}\in\mathbb{Q}.
\]
If \(\psi\) is nondegenerate then \(\lambda\neq 0\). If \(\Psi\) is integral then \(\lambda\in\mathbb{Z}\).

This is the entire bridge. No step uses period maps, fillings, or \(S^6\).

---

## I. What remains outside these proofs

- Compatibility of \(\lambda\omega_0\) with a complex structure \(J(z)\) (positivity of \(\omega_0(\,\cdot\,,J\,\cdot\,)\)).
- Existence of \(\tau,\mu,\beta\) and of the compactification \(X\).
- Hypotheses H1–H4 of the tether interface.

END.
