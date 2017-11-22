require 'csv' #this is a gem
require 'matrix'

matrix1 = File.new(ARGV[0])
matrix2 = File.new(ARGV[1])

mat1 = CSV.read(matrix1)
mat2 = CSV.read(matrix2)

mat1 = Matrix[*mat1].map {|el| el.to_i} #elements of the matrix becoming integers
mat2 = Matrix[*mat2].map {|el| el.to_i} #elements of the matrix becoming integers

if mat1.column_count == mat2.row_count
	mat3 = mat1 * mat2
	if mat3.square?
		mat4 = mat3.t                   #transposing mat3
		mat4 = mat4.map {|el| el = -el} #At = -At
		if mat4.eql?(mat3)              #-At == A
			puts 'true'
		else
			puts 'false'
		end
	end
else
	puts 'undefined'
end






