#Simeon Chakarov №24 11B class
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

if secondMatrix_rows != firstMatrix_columns
		puts "undefined"
	else
		result = (Matrix.rows(forFirstMatrix) * Matrix.rows(forSecondMatrix))
		result1 = result1.map {|ch| ch = -ch}.transpose
	
		if result1 == result
			puts "true"
		else
			puts "false"
		end
end

