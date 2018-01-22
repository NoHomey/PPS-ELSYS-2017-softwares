import sys
import lib


matrix1 = []
matrix2 = []


lib.read('./matrix1.csv', matrix1)
lib.read('./matrix2.csv', matrix2)

# lib.read(sys.argv[1], matrix1)
# lib.read(sys.argv[2], matrix2)

if len(matrix2) != len(matrix1[0]):
    print('undefinied')
    sys.exit()


added = lib.multiply(matrix1, matrix2)

if lib.modify(added, mode='transpone') == added:
    print('true')
else:
    print('false')
