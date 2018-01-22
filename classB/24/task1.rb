#Simeon Chakarov №24 11b class
require 'matrix'
require 'csv'

forFirstMatrix = Array.new
forSecondMatrix = Array.new

firstMatrix_rows = 0
secondMatrix_rows = 0

firstMatrix_coloumns = 0
secondMatrix_coloumns = 0

CSV.foreach("./matrix1.csv") do |rows|
	forFirstMatrix << rows.map(&:to_i)
	firstMatrix_rows = firstMatrix_rows + 1
	firstMatrix_coloumns = rows.size
end

CSV.foreach("./matrix2.csv") do |rows|
	forSecondMatrix << rows.map(&:to_i)
	secondMatrix_rows = secondMatrix_rows + 1
	secondMatrix_coloumns = rows.size
end


begin 
	if (firstMatrix_rows != secondMatrix_rows || firstMatrix_coloumns != secondMatrix_coloumns) 
		puts "undefined"
	else
		(Matrix.rows(forFirstMatrix) + Matrix.rows(forSecondMatrix)).symmetric?
		puts "true"
	end


	rescue ExceptionForMatrix::ErrDimensionMismatch
		puts "false"

end
