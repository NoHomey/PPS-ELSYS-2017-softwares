require "csv"
 
m1 = CSV.read("./matrix1.csv");
m2 = CSV.read("./matrix2.csv");
 
rows1 = m1.length
cols1= m1[0].length
rows2 = m2.length
cols2= m2[0].length

p rows1
p rows2
p cols1
p cols2

if rows1 != rows2 || cols1 != cols2
 	p 'undefined'
 	return
end

if cols1 != rows1
    p true
    return
end

result = Array.new(rows1){Array.new(cols1)}

for i  in 0..rows1 - 1
 	for k in 0..cols1 - 1
 		new[i][k] = m1[i][k].to_i + m2[i][k].to_i
	end
end
 
for a  in 0..rows1 - 1
	for b in 0..cols1 - 1
		if new[a][b] == new[b][a]
 			p false
 			return
		end
	end
end
 
