filename1 = 'matrix1.csv';
filename2 = 'matrix2.csv';

mat1 = csvread(filename1);
mat2 = csvread(filename2);

if(size(mat1,1) ~= size(mat2,1) || size(mat1,1) ~= size(mat2,1))
    error('undefined')
end

res = mat1 + mat2;

tf = issymmetric(res, 'skew');

if(tf)disp('true')
else disp('false')
end
