import numpy as np

matrixOne = np.genfromtxt('matrix1.csv', delimiter=",", dtype = int)
matrixTwo = np.genfromtxt('matrix2.csv', delimiter=",", dtype = int)

if matrixOne.shape[1] != matrixTwo.shape[0]:
	print("undefined")
	exit()
else:
	result = np.dot(matrixOne, matrixTwo)
	print((result.transpose() == -result).all())