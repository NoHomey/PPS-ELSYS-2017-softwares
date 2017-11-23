require 'csv'
require 'matrix'
	arr1 = Array.new
	arr1_rows = 0
	arr1_col = 0
	arr2 = Array.new
	arr2_rows = 0
	arr2_col = 0
	CSV.foreach ('matrix1.csv') do |row| 
		arr1 << row.map(&:to_i)
		arr1_rows += 1
		arr1_col = row.size
	end

	CSV.foreach ('matrix2.csv') do |row| 
		arr2 << row.map(&:to_i)
		arr2_rows += 1
		arr2_col = row.size
	end
	begin
		if arr1_col != arr2_rows
			puts "undefined"
		else
			(Matrix.rows(arr1) * Matrix.rows(arr2)).symmetric?
				puts "true"
			end
			rescue ExceptionForMatrix::ErrDimensionMismatch
				puts "false"
		end
