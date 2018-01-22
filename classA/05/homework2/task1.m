M1 = csvread('matrix1.csv')
M2 = csvread('matrix2.csv')

if(size(M1,2)~=size(M2,2) || size(M1,1)~=size(M2,1))
    error('undefined')
end

result = M1 + M2

if (issymmetric(result))
    disp('true')
else disp('false')    
end   
