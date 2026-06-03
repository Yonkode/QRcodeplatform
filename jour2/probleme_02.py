from math import comb

#1- Calculons 

N = 200 
K = 120
M = 50
L = 30
n = 3

nSucess = N - K
p1 = comb(K, 3)/comb(N,3)

print(f"1- La probabilité est : {p1:.4f}")

#2- Calculons#2-Calculons

p2 = (comb(L,1)*comb(N-L,2))/comb(N,3)

print(f"2- La probabilité est : {p2:.4f}")

#Calculons
p = K/N

E = n*p

V = n*p*(1-p) * ((N-n)/(N-1))
print(f"3- L'espérance est : {E:.4f}")
print(f"3- La variance est : {V:.4f}")

#4- Calculons

p_x2 = (comb(K,2)*comb(N-K,1))/comb(N,3)
p_x3 = comb(K,3)/comb(N,3)

pgeo2 = p_x2 + p_x3
print(f"4- La probabilité est : {pgeo2:.4f}")