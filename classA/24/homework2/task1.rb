require 'csv' #this is a gem
require 'matrix'


matrix1 = File.new(ARGV[0])
matrix2 = File.new(ARGV[1])

mat1 = CSV.read(matrix1)
mat2 = CSV.read(matrix2)

mat1 = Matrix[*mat1].map {|el| el.to_i} #elements of the matrix becoming integers
mat2 = Matrix[*mat2].map {|el| el.to_i} #elements of the matrix becoming integers

if mat1.row_count == mat2.row_count and mat1.column_count == mat2.column_count
	mat3 = mat1 + mat2
	if mat3.symmetric?
		puts 'true'
	else
		puts 'false'
	end
else
	puts 'undefined'
end

