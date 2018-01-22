require 'csv'
require 'matrix'

mat1 = "./matrix1.csv"
mat2 = "./matrix2.csv"

line_count1 = 0 #broq na redovete
elements_in_line_count1 = 0	#broq na elemntite v edin red :) 


line_count2 = 0
elements_in_line_count2 = 0


arr1 = Array.new    
arr2 = Array.new    

CSV.foreach(mat1) do |row|
  arr1 << row.map(&:to_i) 
  line_count1 += 1
  elements_in_line_count1 =  row.size
end

CSV.foreach(mat2) do |row|
  arr2 << row.map(&:to_i)
  line_count2 += 1
  elements_in_line_count2 =  row.size
end


begin 
	if elements_in_line_count1 != elements_in_line_count2 || line_count1 != line_count2 
	
		puts "undefined"
end 

	else
		(Matrix.rows(arr1) + Matrix.rows(arr2)).symmetric?
		puts "true"
	end

	
		puts "false"

end
