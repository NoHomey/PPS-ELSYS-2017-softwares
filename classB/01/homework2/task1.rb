require "csv"

pyrvamatrica = CSV.read("./matrix1.csv");
vtoramatrica = CSV.read("./matrix2.csv");

if pyrvamatrica.length == vtoramatrica.length && pyrvamatrica[0].length == vtoramatrica[0].length

redove = vtoramatrica.length
koloni = vtoramatrica[0].length

if koloni != redove
	p false
	return
end

tretimasiv = Array.new(redove){Array.new(koloni)}

for i  in 0..redove - 1
	for j in 0..koloni - 1
		tretimasiv[i][j] = pyrvamatrica[i][j].to_i + vtoramatrica[i][j].to_i
	end
end

for i  in 0..redove - 1 
	for j in 0..koloni - 1 
		if tretimasiv[i][j] == tretimasiv[j][i]
 		p false
		return
 		end
 	end
end

p true
else 
	p 'undefined'
	return
end
