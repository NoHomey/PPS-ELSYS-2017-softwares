import numpy as np

matrixOne = np.genfromtxt('matrix1.csv', delimiter=",", dtype = int)
matrixTwo = np.genfromtxt('matrix2.csv', delimiter=",", dtype = int)

if matrixOne.shape != matrixTwo.shape:
	print("undefined")
	exit()
else:
	result = np.add(matrixOne, matrixTwo)
	print((result.transpose() == result).all())