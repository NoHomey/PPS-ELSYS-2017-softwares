require 'csv'

matrix1 = CSV.read("./matrix1.csv")
matrix2 = CSV.read("./matrix2.csv");

if matrix1.length == matrix2.length && matrix1[0].length == matrix2[0].length

	count_rows = matrix1.length
	count_cols = matrix1[0].length

	if count_rows != count_cols 
	
		p false
 		return
	end

	resulted_matrix = Array.new(count_rows){Array.new(count_cols)}

	for i in 0..count_rows - 1
		for k in 0..count_cols - 1
			resulted_matrix[i][k] = matrix1[i][k].to_i + matrix2[i][k].to_i
			p resulted_matrix[i][k]
		end
	end		

	for i in 0..count_rows - 1	
		for k in 0..count_cols - 1
		    	if resulted_matrix[i][k] == resulted_matrix[k][i]
		
				p false
				return
			end
		end
	end
	
	p true

else
	puts 'undefined'
	return
end
