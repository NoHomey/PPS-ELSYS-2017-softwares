
require "csv"
require 'matrix'

matrix_1 = ARGV[0]
matrix_2 = ARGV[1]

def valid_col file
  a = CSV.read(file).map { |e| e.length }
  return a.min == a.max
end

def col_count file
  a = CSV.read(file).map { |e| e.length }
  return a.max
end

def row_count file
  return line_count = `wc -l "#{file}"`.strip.split(' ')[0].to_i
end

def can_i_sum matrix_1, matrix_2
  return row_count(matrix_1) == row_count(matrix_2) && col_count(matrix_1) == col_count(matrix_2)
end

def is_it_symetrical matrix

  return row_count(matrix) == col_count(matrix)
end

def matrix_from_CSV(fname)
  CSV.read(fname, converters: [:integer])
end

def sum_arrays(a1, a2)
  return a1.zip(a2).map { |e1,e2| (e1.is_a? Array) ? sum_arrays(e1,e2) : e1 + e2 }
  # ZIP converts any arguments to arrays, then merges elements of self with corresponding
  # elements from each argument. This generates a sequence of self.size n-element arrays,
  # where n is one more that the count of arguments.
end

def sum matrix_1, matrix_2
  arr_m1 = matrix_from_CSV(matrix_1)
  arr_m2 = matrix_from_CSV(matrix_2)
  sum_matrix_file = 'sum_matrix_file.csv'

  File.write(sum_matrix_file, sum_arrays(arr_m1, arr_m2).to_a)

  CSV.open(sum_matrix_file, "w") do |f|
    sum_arrays(arr_m1, arr_m2).each do |x|
      [x].each do |y|
        f << y
      end
    end
  end

  return sum_matrix_file
end

if(valid_col(matrix_1) && valid_col(matrix_2))
  if(can_i_sum(matrix_1, matrix_2))
    puts is_it_symetrical(sum(matrix_1, matrix_2))
  else
    puts "undefined"
  end
else
  puts "Not complete matrix"
end
