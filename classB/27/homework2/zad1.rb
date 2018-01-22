require 'csv'
require 'matrix'
matrix0 = CSV.read('./matrix1.csv',converters: :numeric);
matrix1 = CSV.read('./matrix2.csv',converters: :numeric);
if matrix0.length == matrix1.length && matrix0[0].length == matrix1[0].length
	matrix0.collect.with_index {|x, i|
		x.collect.with_index{|numb, ind|
			matrix0[i][ind] = matrix1[i][ind] + numb
		}
	}
	transponded = Array.new
	matrix0.collect.with_index {|row, i|
		vector = Array.new
                matrix0.collect.with_index{|numb, ind|
                        vector.push(matrix0[ind][i])
                }
		transponded.push(vector);
        }
	matrix0.collect.with_index {|x, i|
                x.collect.with_index{|numb, ind|
                        matrix0[i][ind] = -matrix0[i][ind]
                }
        }
	transponded.collect.with_index {|x, i|
                x.collect.with_index{|numb, ind|
			if transponded[i][ind] != matrix0[i][ind]
				p 'false'
				return
			end
                }
        }
	p 'true'
else 
	p 'undefined'
end
