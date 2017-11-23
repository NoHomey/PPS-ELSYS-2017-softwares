require "csv"

matrix1 = CSV.read("./matrix1.csv");
matrix2 = CSV.read("./matrix2.csv");

if matrix1.length != matrix2.length || matrix1[0].length != matrix2[0].length
	p 'undefined'
	return
end

rows = matrix1.length
cols = matrix1[0].length
if cols != rows
	p false
	return
end
result = Array.new(rows){Array.new(cols)}

for i  in 0..rows - 1
	for j in 0..cols - 1
		result[i][j] = matrix1[i][j].to_i + matrix2[i][j].to_i
	end
end

for i  in 0..rows - 1
	for j in 0..cols - 1
		if result[i][j] != result[j][i]
			p false
			return
		end
	end
end

p true
