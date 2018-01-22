require 'csv'
require 'matrix'

matrix1 = "./matrix1.csv"
matrix2 = "./matrix2.csv"

line_count = 0
elements_in_line_count = 0
arr1 = Array.new
arr2 = Array.new

CSV.foreach(matrix1) do |row|
  arr1 << row.map(&:to_i)
  line_count += 1
  elements_in_line_count =  row.size
end

n1 = elements_in_line_count
m1 = line_count

line_count = 0
elements_in_line_count = 0

CSV.foreach(matrix2) do |row|
  arr2 << row.map(&:to_i)
  line_count += 1
  elements_in_line_count =  row.size
end

n2 = elements_in_line_count
m2 = line_count

if m2 != n1
  puts "undefined"
else
  res1 = (Matrix.rows(arr1)*Matrix.rows(arr2))
  res2 = res1.map {|el| el = -el}.transpose #At = -At

  if res2 == res1
    puts "true"
  else
    puts "false"
  end

end
