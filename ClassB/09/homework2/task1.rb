require 'csv'
require 'matrix'

matrix1 = CSV.read(ARGV[0],converters: :numeric)
matrix2 = CSV.read(ARGV[1],converters: :numeric)

if matrix1.length != matrix2.length || matrix1[0].length != matrix2[0].length
	p 'undefined'
	return
end

if matrix1.length == matrix2.length && matrix1[0].length == matrix2[0].length
    matrix1.collect.with_index {|x, i|
        x.collect.with_index {|numb, ind|
            matrix1[i][ind] = matrix2[i][ind]  + numb
        }
    }
    p 'false'
    transponded = Array.new
    matrix1[0].collect.with_index{ |row, i|
        vector = Array.new
        matrix1.collect.with_index{|numb, ind|
            vector.push(matrix1[i][ind])
        }
    }
end

p 'true'