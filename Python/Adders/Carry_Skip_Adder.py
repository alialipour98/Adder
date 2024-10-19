def MUX    (A : int, B : int, Sel : int)        -> int   :
    return B if Sel else A
def FA_1Bit(A : int, B : int, Cin  = 0)         -> tuple :
    P    =  A ^ B
    S    =  P ^ Cin
    Cout = (A & B) | (A & Cin) | (B & Cin)
    return (S, Cout)
def FA_nBit(A : int, B : int, N : int, C0  = 0) -> tuple :
    A        = f'{A:0{N}b}'
    B        = f'{B:0{N}b}'
    A        = A[::-1]
    B        = B[::-1]

    Sum   = [0 for _ in range(N)]
    Carry = [0 for _ in range(N+1)]

    Carry[0] = C0

    for i in range(N):
        (Sum[i], Carry[i+1]) = FA_1Bit(int(A[i]), int(B[i]), Carry[i])
    
    Sum = Sum[::-1]
    return (Sum, Carry[N])
def CSK    (A : int, B : int, M = 4, Cin = 0  ) -> int   :
    Na = (A).bit_length()   # Number of bits
    Nb = (B).bit_length()   # Number of bits

    maxBit = max(Na, Nb)
    Group  = round(maxBit/M) + 1

    P  = f'{(A ^ B):0{M * Group}b}'
    G  = f'{(A & B):0{M * Group}b}'

    A  = f'{A:0{M * Group}b}'
    B  = f'{B:0{M * Group}b}'

    C  = list()

    C.append(0)

    A  = A[::-1]
    B  = B[::-1]
    P  = P[::-1]
    G  = G[::-1]

    Progation_group = list()
#    Carry_group     = list()

    propagations    = 1
    for i in range(Group):
        for j in range(M):
            propagations &= int(P[j + i*M])
        Progation_group.append(propagations)
#        p = 1

    A = sum([int(x) * (2**i) for i, x in enumerate(A)])
    B = sum([int(x) * (2**i) for i, x in enumerate(B)])

    Sum = [0 for _ in range(M*Group)]
    Partial_Sum = [0 for _ in range(M)]

    (Partial_Sum, Cout) = FA_nBit(A % (2 ** M), B % (2 ** M), M, Cin)
    A //= 2 ** M
    B //= 2 ** M
    muxInput = Cin

    Partial_Sum = Partial_Sum[::-1]
    for i in range(M):
        Sum[-1-i] = Partial_Sum[i]

    for i in range(1, Group):
        (Partial_Sum, Cout) = FA_nBit(A % (2 ** M), B % (2 ** M), M, MUX(Cout, muxInput, Progation_group[i]))
        Partial_Sum = Partial_Sum[::-1]
        for j in range(M):
            Sum[-1-i*M-j] = Partial_Sum[j]
        A //= 2 ** M
        B //= 2 ** M
        muxInput = MUX(Cout, muxInput, Progation_group[i])

    Sum = Sum[::-1]
    Sum = sum([int(x) * (2**i) for i, x in enumerate(list(Sum))])

    return Sum, Cout