require 'csv'

matrix1 = "./matrix1.csv";
matrix2 = "./matrix2.csv";

arr1 = [];
arr2 = [];

arr1_row = 0, arr2_row = 0;
arr1_col = 0, arr2_col = 0;

CSV.foreach(matrix1) do |row|
	arr1 << row.map(&:to_i);
	arr1_row = arr1.length;
	arr1_col = arr1[0].length;
end


CSV.foreach(matrix2) do |row|
	arr2 << row.map(&:to_i);
	arr2_row = arr2.length;
	arr2_col = arr2[0].length;
end

result = [];


if arr1_row != arr2_row || arr1_col != arr2_col
	puts undefined;
	
else for i in 0..arr1.length - 1
	vector = []; 
	for j in 0..arr1[0].length - 1 
		vector.push(arr1[i][j] + arr2[i][j]);
	end
	result.push(vector);

     end

for i in 0..arr1.length - 1
	for j in 0..arr1[0].length - 1
		if result[i][j] != result[j][i]
			p result[i][j], result[j][i];
			puts false;
			return;
		end
	end
end

puts true;

end
