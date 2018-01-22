#include <iostream>
#include <fstream>
#include <string>
using namespace std;

class MatrixErrors
{
	string sterror_;
public:
    MatrixErrors(string error)
	{
		sterror_ = error;
	}
	string get_msg()
	{
		return sterror_;
	}
};

class Matrix
{
    int rows_;
    int columns_;
    int (*data_)[10];
public:
    Matrix () : rows_(0), columns_(0), data_(new int[10][10]){}
	~Matrix (){
		delete [] data_;
	}

    void csv_to_matrix(string file_name)
    {
        string line;
        ifstream myfile;
        myfile.open(file_name.c_str());
        if(myfile.is_open())
        {
            while (getline(myfile,line))
            {
                columns_ = 0;
                for(int i = 0; i<line.length(); i++)
                {
                    if (line[i]!=','&&line[i]!=' '&&line[i]!='-')
                    {
                        if(line[i-1]=='-') data_[rows_][columns_] = -(line[i] - '0');
                        else data_[rows_][columns_] = line[i] - '0';
                        columns_++;
                    }
                }
                rows_++;
            }
            myfile.close();
        }
        else throw MatrixErrors("Unable to open");
    }

    Matrix& mul(const Matrix& other){
        Matrix help;
        if(columns_!=other.rows_)throw MatrixErrors("undefined");
        for(int i = 0; i < rows_; ++i)
            for(int j = 0; j < other.columns_; ++j)
                help.data_[i][j] = 0;
        for(int i = 0; i < rows_ ; ++i)
            for(int j = 0; j < other.columns_; ++j)
                for(int k = 0; k < columns_; ++k)
                    help.data_[i][j] += data_[i][k] * other.data_[k][j];
        for(int i = 0; i < rows_; ++i)
            for(int j = 0; j < other.columns_; ++j)
                data_[i][j] = help.data_[i][j];
        columns_ = other.columns_;
        return *this;
    }

    bool check_symmetric(){
        bool flag = true;
        if(rows_!=columns_) flag = false;
        else {
            for(int i = 0; i < rows_; ++i)
                for(int j = 0; j < columns_; ++j) {
                    flag = data_[i][j] == data_[j][i];
                    if (!flag) return flag;
                }
        }
        return flag;
    }
};

int main (int argc, char* argv[])
{
    Matrix matrix1, matrix2;
    try {
        matrix1.csv_to_matrix(argv[1]);
        matrix2.csv_to_matrix(argv[2]);
        matrix1.mul(matrix2);
        if(matrix1.check_symmetric()) cout << "true" << endl;
        else cout << "false" << endl;
    } catch(MatrixErrors ex) {
		cout << ex.get_msg() << endl;
	}
    return 0;
}
