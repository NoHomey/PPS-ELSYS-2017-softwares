require 'csv'
require 'matrix'

matrix1 = "./matrix1.csv"
matrix2 = "./matrix2.csv"

array_1 = Array.new
array_2 = Array.new

array1_rows = 0
array1_columns = 0

array2_rows = 0
array2_columns = 0

#the file with the first matrix
CSV.foreach(matrix1) do |rows|
	array_1 << rows.map(&:to_i)
	array1_rows = array1_rows + 1
	array1_columns = rows.size
end

#the file with the second matrix
CSV.foreach(matrix2) do |rows|
	array_2 << rows.map(&:to_i)
	array2_rows = array2_rows + 1
	array2_columns = rows.size
end

	if array2_rows != array1_columns
		puts "undefined"
	else
		result1 = (Matrix.rows(array_1) * Matrix.rows(array_2))
		result2 = result1.map {|ch| ch = -ch}.transpose
	
		if result2 != result1
			puts "false"
		else
			puts "true"
		end
	end
