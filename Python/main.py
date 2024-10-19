from Adders import Carry_Lookahead_Adder
from Adders import Carry_Skip_Adder

import numpy as np

'''
'''
INPUT_1 = int(input("Please Enter an Integer (1) : "))
INPUT_2 = int(input("Please Enter an Integer (2) : "))
CIN     = int(input("Please Enter Carry          : "))

CLA_out, _ = Carry_Lookahead_Adder.CLA(INPUT_1, INPUT_2, Cin = CIN)
CSK_out, _ = Carry_Skip_Adder.CSK     (INPUT_1, INPUT_2, Cin = CIN)

print(f'Output of CLA => {CLA_out}')
print(f'Output of CSK => {CSK_out}')

'''
A = np.array([[1, 2], [3, 4]])
B = np.array([[6, 6], [1, 9]])

CLA_to_numpy = list()
CSK_to_numpy = list()

for i, j in zip(A.ravel(), B.ravel()):
    S_CLA, _ = Carry_Lookahead_Adder.CLA(int(i), int(j), 0)
    S_CSK, _ = Carry_Skip_Adder.CSK(int(i), int(j), 0)
    CLA_to_numpy.append(S_CLA)
    CSK_to_numpy.append(S_CSK)

CLA_to_numpy = np.array(CLA_to_numpy).reshape(A.shape)
CSK_to_numpy = np.array(CSK_to_numpy).reshape(A.shape)

print(f'Result from CLA => \n {CLA_to_numpy}')
print(f'Result from CSK => \n {CSK_to_numpy}')
'''
