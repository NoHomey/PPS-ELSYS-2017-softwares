import csv


def read(path, storage):
    with open(path, newline='') as raw:
        reader = csv.reader(raw, delimiter=',')
        for row in reader:
            storage.append([int(i) for i in row])


# bad, but works
def modify(matrix, matrix2=None, mode=None):
    x = len(matrix)
    y = len(matrix[0])

    if mode == 'transpone':
        new_matrix = [[None] * x] * y
    else:
        new_matrix = [[None] * y] * x

    for i in range(x):
        for j in range(y):
            if mode == 'transpone':
                new_matrix[j][i] = matrix[i][j]
            elif mode == 'add':
                new_matrix[i][j] = matrix[i][j] + matrix2[i][j]
            elif mode == 'negate':
                new_matrix[i][j] = matrix[i][j] * -1
            elif mode == 'multiply':
                pass

    return new_matrix


def multiply(matrix1, matrix2):
    x = len(matrix2)
    new_matrix = [[None] * x] * x

    for i in range(x):
        for j in range(x):
            tmp = [
                matrix1[i][k] * matrix2[k][j] for k in range(x)
            ]
            new_matrix[i][j] = sum(tmp)

    return new_matrix
