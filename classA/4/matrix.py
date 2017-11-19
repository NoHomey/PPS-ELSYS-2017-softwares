import csv
from typing import List


def extract_matrix_from_csv(matrix_filename: str) -> List[List[int]]:
    with open(matrix_filename, mode='r', encoding='utf-8') as f:
        return [list(map(int, row)) for row in csv.reader(f)]


class Matrix:
    def __init__(self, matrix):
        self.matrix = matrix

    def __str__(self):
        result = []
        for row in self.matrix:
            result.append(repr(row))

        return '\n'.join(result)

    def __len__(self):
        return sum(map(len, self.matrix))

    def __eq__(self, other):
        return self.matrix == other.matrix

    def __neg__(self):
        result_matrix = [list(map(lambda x: -x, row)) for row in self.matrix]
        
        return Matrix(result_matrix)

    def __add__(self, other):
        if len(self) != len(other):
            return None

        result_matrix = [list(map(sum, zip(*t))) for t in zip(self.matrix, other.matrix)]
        
        return Matrix(result_matrix)

    def __mul__(self, other):
        if self.cols_count != other.rows_count:
            return None

        result_matrix = []
        for x_row in self.matrix:
            result_row = []
            for y_col in zip(*other.matrix):
                result_row.append(sum(a * b for a, b in zip(x_row, y_col)))
            
            result_matrix.append(result_row)

        return Matrix(result_matrix)
    
    @property
    def rows_count(self) -> int:
        return len(self.matrix)

    @property
    def cols_count(self) -> int:
        return len(self.matrix[0])

    @property
    def is_symmetric(self) -> bool:
        return self == Matrix.transposed(self)

    @property
    def is_asymmetric(self) -> bool:
        return self == -self

    @staticmethod
    def transposed(matrix):
        return Matrix(list(map(list, zip(*matrix.matrix))))

