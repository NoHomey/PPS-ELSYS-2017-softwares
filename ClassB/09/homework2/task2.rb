require 'csv'
require 'matrix'

matrix1 = CSV.read(ARGV[0],converters: :numeric)
matrix2 = CSV.read(ARGV[1],converters: :numeric)

if matrix1.length != matrix2.length || matrix1[0].length != matrix2[0].length
	p 'undefined'
	return
end

rows = matrix1.length
cols = matrix1[0].length
if matrix1.length != matrix1[0].length
	p true
	return
end
result = Array.new(matrix1.length, 0){Array.new(matrix1[0].length, 0)}

for i  in 0..matrix1.length - 1
	for j in 0..matrix1[0].length - 1
		for k in 0..matrix1.length - 1
			#print "matrix1: ",matrix1[i][k],"  matrix2:",matrix2[k][j],"\n"
			result[i][j] += matrix1[i][k].to_i * matrix2[k][j].to_i
		end
	end
end

for i  in 0..matrix1.length - 1
	for j in 0..matrix1[0].length - 1
		if result[i][j] != (-1 * result[j][i])
			p true
			return
		end
	end
end

p false