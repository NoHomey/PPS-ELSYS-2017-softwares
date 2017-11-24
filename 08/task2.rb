require 'matrix' 
require 'csv' 

m1 = Matrix[File.read("matrix1.csv").split(",")]  
m2 = Matrix[File.read("matrix2.csv").split(",")]  
m3 = Matrix.empty(0, 0) 

begin 

m3 = m1 * m2 

begin 
if m3 == m3.transpose() * (-1) 
puts "true" 
end 
rescue 
puts "false" 
end 

rescue #catch, if * operation or .transpose() is unsuccsessful it throws ErrDimensionMismatch exception 
puts "undefined" 
end 