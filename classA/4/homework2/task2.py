import sys

from matrix import extract_matrix_from_csv, Matrix


def main():
    has_provided_filenames = len(sys.argv) > 2

    first_matrix_filename = sys.argv[1] if has_provided_filenames else './matrix1.csv'
    first_matrix_values = extract_matrix_from_csv(first_matrix_filename)
    first_matrix = Matrix(first_matrix_values)

    second_matrix_filename = sys.argv[2] if has_provided_filenames else './matrix2.csv'
    second_matrix_values = extract_matrix_from_csv(second_matrix_filename)
    second_matrix = Matrix(second_matrix_values)
    
    result = first_matrix * second_matrix

    if result:
        print('true' if result.is_asymmetric else 'false')
    else:
        print('undefined')

if __name__ == '__main__':
    main()
