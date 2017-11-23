require 'csv'
require 'matrix'

first_file = "./matrix1.csv"
second_file = "./matrix2.csv"

m1 = Matrix[]
m2 = Matrix[]

CSV.foreach(first_file) do |row|
  m1 = Matrix.rows(m1.to_a << row.map(&:to_i))
end

CSV.foreach(second_file) do |row|
  m2 = Matrix.rows(m2.to_a << row.map(&:to_i))
end

begin
  result = m1 + m2
  puts result.transpose == result * -1
rescue
  puts 'undefined'
end