require "csv"

matrix1 = CSV.read("./matrix1.csv");
matrix2 = CSV.read("./matrix2.csv");

if matrix1.length == matrix2.length && matrix1[0].length == matrix2[0].length

	count_rows = matrix2.length
	count_cols = matrix2[0].length
	
	if count_cols != count_rows
		p false
		return
 	end
 	
	resulted_matrix = Array.new(count_rows, 0){Array.new(count_cols, 0)}
 
	for i  in 0..count_rows - 1	
 		for j in 0..count_cols - 1
 			for k in 0..count_rows - 1
 				
 				resulted_matrix[i][j] += matrix1[i][k].to_i * matrix2[k][j].to_i
 			end
 		end
 	end
 
 	for i  in 0..count_rows - 1
 		for j in 0..count_cols - 1
 			if resulted_matrix[i][j] == (-1 * resulted_matrix[j][i])
 				p false
 				return
 			end
 		end
 	end
 
 	p true
else
		p 'undefined'
		return
end
