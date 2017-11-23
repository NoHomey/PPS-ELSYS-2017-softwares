require 'csv'
matrix0 = CSV.read('./matrix1.csv',converters: :numeric);
matrix1 = CSV.read('./matrix2.csv',converters: :numeric);
if matrix0[0].length == matrix1.length
	
	row = matrix0.length
	col = matrix1[0].length
	
	result = Array.new(row,0){Array.new(col,0)}
	for i in 0..row - 1
		for j in 0..col - 1
			for k in 0..matrix0[0].length - 1
			result[i][j] += matrix0[i][k]*matrix1[k][j]
			end
		end
	end

        transponded = Array.new
        result.collect.with_index {|row, i|
                vector = Array.new
                result.collect.with_index{|numb, ind|
                        vector.push(result[ind][i])
                }
                transponded.push(vector);
        }
	
        transponded.collect.with_index {|x, i|
                x.collect.with_index{|numb, ind|
                        if transponded[i][ind] != result[i][ind]
                                p 'false'
                                return
                        end
                }
        }
        p 'true'
else
        p 'undefined'
end

