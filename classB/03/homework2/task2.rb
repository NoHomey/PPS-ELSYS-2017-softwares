require 'csv' 
require 'matrix'
 
matrix1 = File.new(ARGV[0])
matrix2 = File.new(ARGV[1])
 
m1 = CSV.read(matrix1)
m2 = CSV.read(matrix2)
 
m1 = Matrix[*m1].map {|a| a.to_i} #integers
m2 = Matrix[*m2].map {|a| a.to_i} #integers
 
if m1.length != m2[0].length
	p 'undefined'
else
	new1 = m1 * m2
 	if new1.square?
 		new2 = new1.t                   
 		new2 = new2.map {|a| a = -a} 
 		if new2.a?(new1)              
  		    puts 'falce'
 		else
 			puts 'true'
 		end
 	end
end

end
