from sympy import *
import math

z = symbols('z')

f = z**3 -(4 - 11 *I)*z**2 - (22 + 30 *I)*z + 68 +54*I

if f.subs(z, 2 + I).expand() == 0:
    print("True")
else:    print("False")


solutions = solve(f, z)

for s in solutions :
    print(s)

solutions = sorted (solutions, key=lambda x: im(x))

zC, zB, zA = solutions

print("zA =", zA)
print("zB =", zB)
print("zC =", zC)

zD = zC +(zC - zB)

print("zD =", zD)

AB = abs(zB - zA)
AC = abs(zC - zA)
BC = abs(zB - zC)

if math.isclose(AB**2 + AC**2, BC**2) or math.isclose(AB**2 + BC**2, AC**2) or math.isclose(AC**2 + BC**2, AB**2):
    print("True")
else:
    print("False")


A = Point(re(zA), im(zA))
B = Point(re(zB), im(zB))
C = Point(re(zC), im(zC))
D = Point(re(zD), im(zD))

aire = Polygon(A, B, C, D).area

print(f"Aire du quadrilatère ABCD = {aire:.2f}")