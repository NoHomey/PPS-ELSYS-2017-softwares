#include <iostream>
#include <fstream>
#include <string>
#include <regex>
#include <iterator>

using namespace std;
class matrixError{};
class matrix{
	int **arr_;
	bool addable_;
	int x_;
	int y_;
	int sizeY_;
	int sizeX_;

void delete_arr(){
	for(int i = 0; i < sizeY_; ++i) {
    		delete[] arr_[i];
    }
	delete[] arr_;
}

bool is_addable(matrix& other){
	return x_ == other.x_ && y_ == other.y_;
}
bool is_transpose(matrix& other){
	return x_ == other.y_ && y_ == other.x_;
}
public:
	matrix():x_(0), y_(0), sizeY_(10), sizeX_(10), addable_(true){
		arr_ = new int*[sizeY_];
		for (int i = 0; i < sizeY_; ++i){
			arr_[i] = new int[sizeX_];
		}
	}
	~matrix(){
		delete_arr();
	}
	void set_arr(int y, int x, int value){
		 arr_[y][x] = value;
	}
	bool is_full(){
	return x_ == sizeX_ || y_ == sizeY_;
	}
	int get_x(){
		return x_;
	}
	int get_y(){
		return y_;
	}
	int arr(int y, int x){
		return arr_[y][x];
	}
	
	void resize(){
		
		int **tmp_ = new int*[sizeY_ * 2];
		for (int i = 0; i < sizeY_ * 2; ++i)
		{
			tmp_[i] = new int[sizeX_ * 2];
			if(i < sizeY_)
			memcpy(tmp_[i], arr_[i], (sizeX_)* sizeof(int));
		}

		delete_arr();
		arr_ = tmp_;
		sizeY_ *= 2;
		sizeX_ *= 2;
	}

	int read(string file_name)
	{
		char separator = ' ';
		ifstream file (file_name);
		
		string line;
	  		while (file.good())  {
	  			getline(file, line, '\n');
	  			if(line.find(separator) == string::npos)break; //searching for eom
	  			
	  			regex word_regex("(\\S+)");
	    		auto numbers_begin = 
	        	sregex_iterator(line.begin(), line.end(), word_regex);
	    		auto numbers_end = sregex_iterator();
	    		 x_ = 0;
			        for (sregex_iterator i = numbers_begin; i != numbers_end; ++i) {
		        		smatch match = *i;
		        		string match_str = match.str();

		        		if(is_full())resize();
		        			arr_[y_][x_++] = stoi(match_str);
		       		}
			     y_++;
			    }

		return 0;
	}
	void print(){
		
		for(int i = 0; i < y_; ++i){
			for (int k = 0; k < x_; ++k)
			{	
				if(k != 0)cout << ' ';
				cout << arr_[i][k];
			}
			cout << endl;
		}
	}
	bool addable(){
		return addable_;
	}
	matrix transpose(){
		matrix tmp;
		for(int i = 0; i < y_; ++i){
				for (int k = 0; k < x_; ++k)
				{
					 if(tmp.is_full())tmp.resize();
					 tmp.set_arr(k, i,arr_[k][i]);
				}
			
		}
		return tmp;
	}
	matrix negative(){
		matrix tmp;
		for(int i = 0; i < y_; ++i){
				for (int k = 0; k < x_; ++k)
				{	
					 if(tmp.is_full())tmp.resize();
					 tmp.set_arr(i, k, -arr_[i][k]);
				}
			
		}
		return tmp;
	}
	matrix& add(matrix& other){
		 if(is_addable(other)){
			for(int i = 0; i < y_; ++i){
				for (int k = 0; k < x_; ++k)
				{
					 arr_[i][k] += other.arr_[i][k];
				}
			
			}
		}else {cout << "undefined\n"; addable_ = false;}
		return *this;
	}

};
bool skewsymmetric(matrix trs, matrix neg){
			for(int i = 0; i < trs.get_y(); ++i){
				for (int k = 0; k < trs.get_x(); ++k)
				{
					 cout << trs.arr(i, k) << " == " << neg.arr(i, k) << endl;
					 if(trs.arr(i, k) != neg.arr(i, k))return false;
				}
			}
			return true;
}
int main(int argc, char* argv[])
{
	matrix m1, m2;
	matrix result;
	if(argc > 1){
	m1.read(argv[1]);
	m2.read(argv[2]);
	}else{
		m1.read("matrix1.csv");
		m2.read("matrix2.csv");
	}
	m1.print();
	m2.print();
	result = m1.add(m2);
	if(result.addable()){
		result.print();
		
		bool flag = skewsymmetric(result.transpose(), result.negative());
		if(flag){
			cout << "true" << endl;
		}else cout << "false" << endl;

	}
	return 0;
}