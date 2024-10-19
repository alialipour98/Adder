def CAL_Ci (P : str, G : str, i : int, Cin = 0) -> int   :
    Ci = Cin
    for j in range(1, i+1):
        Ci = int(G[j-1]) | (int(P[j-1]) & Ci)
    return Ci
def CLA    (A : int, B : int, Cin = 0) -> tuple :
    Na = (A).bit_length()
    Nb = (B).bit_length()

    maxBit = max(Na, Nb)

    P  = f'{(A ^ B):0{maxBit}b}'
    G  = f'{(A & B):0{maxBit}b}'

    A  = f'{A:0{maxBit}b}'
    B  = f'{B:0{maxBit}b}'
    C  = [Cin]
    S  = list()
    
    A  = A[::-1]
    B  = B[::-1]
    P  = P[::-1]
    G  = G[::-1]

    for i in range(1, maxBit):
        C.append(CAL_Ci(P, G, i, C[0]))
    
    for i in range(maxBit):
        S.append(C[i] ^ int(P[i]))
    S.append(C[-1])
    S = sum([S[i] * (2 ** i) for i in range(maxBit+1)])

    return (S, C[-1])