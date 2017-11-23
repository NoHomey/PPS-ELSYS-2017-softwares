require 'csv'
require 'matrix'

matri1 = File.new(ARGV[0])
matri2 = File.new(ARGV[1])
m1=CSV.read(matri1)
m2=CSV.read(matri2)
m1=Matrix[*m1].map
m2=Matrix[*m2].map
if m1.row_count==m2.row_count and m1.column_count==m2.column_count
	m3=m1+m2
if m3.symmetric?
	puts 'false'
else 
	puts 'true'
end
else
	puts 'undefined'
end
