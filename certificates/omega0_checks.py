"""Scoped certificate. Does not certify the filling, Leray, or S^6."""
import numpy as np
from numpy.linalg import det, matrix_rank
from fractions import Fraction

Omega0 = np.array([[0, 0, 0, 1], [0, 0, 6, 0], [0, -6, 0, 0], [-1, 0, 0, 0]], dtype=int)
T1 = np.array([[1, 0, -6, 2], [0, -1, 1, 1], [0, -1, 0, 1], [0, 0, 0, 1]], dtype=int)
T2 = np.array([[1, 6, 0, -3], [0, 0, -1, 1], [0, 1, 0, 0], [0, 0, 0, 1]], dtype=int)
T0 = np.array([[1, 0, 0, 1], [0, 1, -1, 0], [0, 0, 1, 0], [0, 0, 0, 1]], dtype=int)

def pfaffian4(A):
    return int(A[0, 1] * A[2, 3] - A[0, 2] * A[1, 3] + A[0, 3] * A[1, 2])

assert np.array_equal(Omega0.T, -Omega0)
assert int(round(det(Omega0.astype(float)))) == 36
assert pfaffian4(Omega0) == 6
assert matrix_rank(Omega0.astype(float)) == 4
assert np.array_equal(np.linalg.matrix_power(T1, 3), np.eye(4, dtype=int))
assert np.array_equal(np.linalg.matrix_power(T2, 4), np.eye(4, dtype=int))
N = T0 - np.eye(4, dtype=int)
assert np.array_equal(N @ N, np.zeros((4, 4), dtype=int))
for T in (T1, T2, T0):
    assert int(round(det(T.astype(float)))) == 1
    assert np.array_equal(T.T @ Omega0 @ T, Omega0)

# Engel Prop. 6.1, recorded as an input. generators c, x0, x1.
# relations: c central; x0*x1 = 1; x0**3 = c**m; x1**4 = c**n.
def pi1_order(m, n):
    return abs(4 * m + 3 * n)

m, n = 1, -1
psi = Fraction(m, 3) + Fraction(n, 4)
assert pi1_order(m, n) == 1
assert pi1_order(m, n) == abs(12 * psi)
print("form and monodromy invariance: ok")
print("pi1 order", pi1_order(m, n))
print("not certified: Leray homology, diffeomorphism to S^6")
