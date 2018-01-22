#include <iostream>
#include <fstream>
#include <string>
#include <sstream>

using namespace std;

int main()
{
    ifstream file1( "matrix1.csv" );
    ifstream file2( "matrix2.csv" );	
	string value1, value2;
	int m1 = 0;
	int m2 = 0;
	while ( !file1.eof())
	{

     	getline (file1, value1, '\n' );
		m1++;
	}
	m1--;
	while ( !file2.eof())
	{

     	getline (file2, value2, '\n' );
		m2++;
	}
	m2--;
	file1.clear();
	file1.seekg(0, file1.beg);
	file2.clear();
	file2.seekg(0, file2.beg);
	int n1 = 0;
	int n2 = 0;
	while ( !file1.eof())
	{

     	getline (file1, value1, ',' );
		n1++;
	}
	while ( !file2.eof())
	{

     	getline (file2, value2, ',' );
		n2++;
	}
	file1.clear();
	file1.seekg(0, file1.beg);
	file2.clear();
	file2.seekg(0, file2.beg);
	n1 = n1 / m1;
	n2 = n2 / m2;
	int matrix1[m1][n1];
	int matrix2[m2][n2];	
	int matrix[m1][n2];
	int a1 = 0;
	int a2 = 0;
	int i = 0;
	int k = 0;
	if (m1 == n2 && m2 == n1)
	{
		while(!file1.eof())
		{
			getline (file1, value1, ',' );
			a1 = stoi(value1);
			getline (file2, value2, ',' );
			a2 = stoi(value2);
			if(k < n1)
			{
				matrix1[i][k] = a1;
				matrix2[i][k] = a2;
				k++;
			}
			if(k == n1)
			{
				i++;
				k = 0;
			}
		}
		for(int i = 0; i < m1; i++)
		{
			for(int k = 0; k < n2; k++)
			{
				matrix[i][k] = 0;
			}
		}
		i = 0;
		k = 0;
		int i1 = 0;
		int k1 = 0;
		int i2 = 0;
		int k2 = 0;

		while(i < m1)
		{
			while (k < n2)
			{	
				while (k1 < m2) 
				{
					matrix[i][k] = matrix[i][k] + (matrix1[i1][k1]*matrix2[i2][k2]);
					k1++;
					i2++;
				}
				k1 = 0;
				i2 = 0;
				k2++; 
				k++;
			}
			k2 = 0;
			k = 0;
			i++;
			i1++;
		}
	} else {
		cout << "undefined";
		return 0;
	}
	int count = 0;
	int matrixR[m1][n2];
	if(m1 == n2)
	{
	k = 0;
	i = 0;
	while(i < m1)
		{
			while (k < n2)
			{
				matrixR[i][k] = matrix[k][i];
				k++;
			}
			k = 0;
			i++;
		}
	i = 0;
	k = 0;
	while(i < m1)
	{
		while (k < n2)
		{
			matrix[i][k] = 0 - matrix[i][k];
			k++;
		}
		k = 0;
		i++;
	}
	k = 0;
	i = 0;
	while(i < m1)
		{
			while (k < n2)
			{
				if(matrix[i][k] == matrixR[i][k])
				{
					count++;
				}
				k++;
			}
			k = 0;
			i++;
		}
		if(count == (m1*n2))
		{
			cout << "true"; 
		} else cout << "false";
	} else cout << "false";
	return 0;
}
