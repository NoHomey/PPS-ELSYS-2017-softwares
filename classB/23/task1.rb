require 'csv'
require 'matrix'

	matrica1 = Array.new
	matrica1_rows = 0
	matrica1_columns = 0

	matrica2 = Array.new
	matrica2_rows = 0
	matrica2_columns = 0

	CSV.foreach ('matrix1.csv') do |row| 
		matrica1 << row.map(&:to_i)
		matrica1_rows += 1
		matrica2_columns = row.size
	end

	CSV.foreach ('matrix2.csv') do |row| 
		matrica2 << row.map(&:to_i)
		matrica2_rows += 1
		matrica2_columns = row.size
	end

begin 

	if matrica1_rows != matrica2_rows || matrica1_columns != matrica2_columns 
	
		puts "undefined"
end 

	else
		(Matrix.rows(matrica1) + Matrix.rows(matrica2)).symmetric?
		
		puts "true"
		
	end

		puts "false"

end	
