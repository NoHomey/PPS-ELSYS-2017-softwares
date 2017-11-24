
require 'matrix' 
require 'csv' 

m1 = Matrix[File.read("matrix1.csv").split(",")] 
m2 = Matrix[File.read("matrix2.csv").split(",")] 
m3 = Matrix.empty(0, 0) 

begin  
	m3 = m1 + m2 
	begin 
	m3.symmetric?() 
	puts "true" 
	rescue 
	puts "false" 
	end 
rescue
puts "undefined" 
end 