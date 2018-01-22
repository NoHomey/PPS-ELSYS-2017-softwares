
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

def can_i_mul matrix_1, matrix_2
  return col_count(matrix_1) == row_count(matrix_2) && col_count(matrix_1) == row_count(matrix_2)
end

def is_it_skew_symmetric matrix

a = CSV.read(matrix, converters: [:integer])
i = 0
j = 0
m = row_count(matrix)

   while i <= m do
    while j <= m do
     if(a[i][j]!= -a[j][i])
      return false
     end
      j+=1
    end
      i+=1
   end
  return true
end

def matrix_from_CSV(fname)
  CSV.read(fname, converters: [:integer])
end

def mul matrix_1, matrix_2
  arr_m1 = matrix_from_CSV(matrix_1)
  arr_m2 = matrix_from_CSV(matrix_2)


    rows = Array.new(row_count(matrix_1)) {|i|
        Array.new(col_count(matrix_2)) {|j|
          (0 ... col_count(matrix_1)).inject(0) do |vij, k|
            vij + arr_m1[i][k] * arr_m2[k][j]
          end
        }
      }


  mul_matrix_file = 'mul_matrix_file.csv'

  CSV.open(mul_matrix_file, "w") do |f|
    rows.each do |x|
        f << x
    end
  end

  return mul_matrix_file
end

if(valid_col(matrix_1) && valid_col(matrix_2))
  if(can_i_mul(matrix_1, matrix_2))
    puts is_it_skew_symmetric(mul(matrix_1, matrix_2))
    p CSV.read(mul(matrix_1, matrix_2), converters: [:integer])
  else
    puts "undefined"
  end
else
  puts "Not complete matrix"
end
