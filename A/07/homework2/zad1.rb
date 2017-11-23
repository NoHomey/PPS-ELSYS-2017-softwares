require 'csv'

m1 = CSV.read("./matrix1.csv")
m2 = CSV.read("./matrix2.csv")

def sum *a
	arr=[]
	a[0].each_index do|r|
		row=[]
		a[0][r].each_index do |c|
			row << a.inject(0){|sum,e| sum += e[r][c].to_i}
		end
	arr << row
	end
	arr
end

def neg a
	a.length.times do |row|
		a[0].length.times do |col|
			a[row][col] *= -1
		end
	end
	a 
end

if m1.length == m2.length and m1[0].length == m2[0].length
	res = sum(m1,m2)
	if res.transpose == neg(res)
		p true
	else
		p false
	end
else
	puts "undefined"
end
