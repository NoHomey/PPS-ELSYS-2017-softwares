require 'csv'
require 'matrix'

first_matrix = "./matrix1.csv"
second_matrix = "./matrix2.csv"

rows1 = 0
columns1 = 0

arr1 = Array.new
arr2 = Array.new

CSV.foreach(first_matrix) do |row|
	arr1 << row.map(&:to_i)
	rows1 += 1
	columns1 = row.size
end

rows2 = 0
columns2 = 0

CSV.foreach(second_matrix) do |row|
	arr2 << row.map(&:to_i)
	rows2 += 1
	columns2 = row.size
end

if rows1 == rows2 && columns1 == columns2
puts Matrix.rows(arr1) + Matrix.rows(arr2)
elsif
puts "undefined"
end

if rows1 == rows2 && columns1 == columns2
puts "false"
elsif
puts "true"
end

