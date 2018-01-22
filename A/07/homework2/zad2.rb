require 'csv'

m1 = CSV.read("./matrix1.csv")
m2 = CSV.read("./matrix2.csv")

res = Array.new

num = []

carr = []

if m1[0].length == m2.length or m2[0].length == m1.length
	ind = 0
	m1.length.times do
		m1[0].length.times do |i|
			#p m1[ind][i]
			num.push(m1[ind][i])

			m2.length.times do |ii|
				#p m2[ii]
				carr.push(m2[ii])
			end
			
		end
		ind += 1
		#p "NEW"
	end
else
	p "undefined"
end

p num
p carr
