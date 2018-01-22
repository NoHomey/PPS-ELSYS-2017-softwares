#include <iostream>
#include <sstream>
#include <string>
#include <fstream>

using namespace std;

int matrix_sum(string, string);
int **read_matrix(string, int *, int *);

int main(int argc, char **argv) {
	int result;
	if(argc == 1) {
		result = matrix_sum("matrix1.csv", "matrix2.csv");
	}
	else {
		result = matrix_sum(argv[1], argv[2]);
	}
	if(result < 0) {
		printf("undefined\n");
	}
	else if(!result) {
		printf("true\n");
	}
	else {
		printf("false\n");
	}
	return 0;
}

int **read_matrix(string m, int *row, int *col) {
	ifstream fs(m);
	string line;

	int size_row = 1000;
	int size_col = 1000;
	int **matrix = 0;
	matrix = new int*[size_row];
	int i = 0;
	int j = 0;
	while(getline(fs, line)) {
		matrix[i] = new int[size_col];
		j = 0;
		istringstream in(line);
		while(!in.fail()) {
			in >> matrix[i][j];
			in.ignore();
			if(in.good()) {
				j++;
			}
		}
		if(i == 0) {
			*col = j + 1;
		}
		if(j != *col - 1) {
			*col = -1;
		}
		i++;
	}
	*row = i;
	fs.close();
	return matrix;
}

int matrix_sum(string m1 = "matrix1.csv", string m2 = "matrix2.csv") {
	int row1 = 0, col1 = 0, row2 = 0, col2 = 0;
	int **matrix1 = read_matrix(m1, &row1, &col1);
	int **matrix2 = read_matrix(m2, &row2, &col2);

	int **sum = 0;
	if(row1 == row2 && col1 == col2) {
		sum = new int*[row1];
		for(int i = 0; i < row1; i++) {
			sum[i] = new int[col1];
			for(int j = 0; j < col1; j++) {
				sum[i][j] = matrix1[i][j] + matrix2[i][j];
			}
		}
	}
	else {
		return -1;
	}
	if(row1 == col1){
		for(int i = 0; i < row1; i++) {
			for(int j = 0; j < col1; j++) {
				if(sum[i][j] != sum[j][i]) {
					return 1;
				}
			}
		}
		return 0;
	}
	else {
		return 1;
	}
}