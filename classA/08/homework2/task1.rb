require 'csv'
require 'matrix'

column = 0
rows = 0
arr1 = Array.new
arr2 = Array.new

matrix1 = "./matrix1.csv"
matrix2 = "./matrix2.csv"

CSV.foreach(matrix1) do |row|
  arr1 << row.map(&:to_i)
  rows += 1;
  column = row.size
end

col_m1 = column
row_m1 = rows

column = 0
rows = 0

CSV.foreach(matrix2) do |row|
  arr2 << row.map(&:to_i)
  rows += 1
  column =  row.size
end

col_m2 = column
row_m2 = rows

begin
  if col_m1 != col_m2 || row_m1 != row_m2
    puts "undefined"
  else
    puts (Matrix.rows(arr1) + Matrix.rows(arr2)).symmetric?
  end
rescue ExceptionForMatrix::ErrDimensionMismatch # thank jebus for the great library
  puts "false"
end
