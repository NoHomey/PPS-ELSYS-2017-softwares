import sys
import lib

matrix1 = []
matrix2 = []

lib.read('./matrix1.csv', matrix1)
lib.read('./matrix2.csv', matrix2)

# lib.read(sys.argv[1], matrix1)
# lib.read(sys.argv[2], matrix2)

if len(matrix1) != len(matrix2) or len(matrix1[0]) != len(matrix2[0]):
    print('undefinied')
    sys.exit()

added = lib.modify(matrix1, matrix2, mode='add')

if lib.modify(added, mode='transpone') == lib.modify(added, mode='negate'):
    print('true')
else:
    print('false')
