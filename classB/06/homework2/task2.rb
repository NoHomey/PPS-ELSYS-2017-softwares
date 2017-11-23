require 'csv'

matrix1 = CSV.read("./matrix1.csv");
matrix2 = CSV.read("./matrix2.csv");

arr1_row = matrix1.length;
arr2_row = matrix2.length;
arr1_col = matrix1[0].length;
arr2_col = matrix2[0].length;

result = Array.new(matrix1.length, 0){Array.new(matrix1[0].length, 0)}

if arr1_row != arr2_col
	puts "undefined"
else for i  in 0..matrix1.length - 1
	for j in 0..matrix1[0].length - 1
		for k in 0..matrix1.length - 1
			result[i][j] += matrix1[i][k].to_i * matrix2[k][j].to_i
		end
	end
     end

for i  in 0..matrix1.length - 1
	for j in 0..matrix1[0].length - 1
		if result[i][j] != (-1 * result[j][i])
			puts false
			return
		end
	end
end
puts true

end


