function [matrix] = MatrixMaker(conv)
%

%setting up the matrix instead of hard coding it thanks will
A = eye(21,21);
A(2,1) = -1;
A(3,2) = (conv-1);
A(10,2) = -conv;
A(5,3) = -1;
A(6,5) = -0.09;
A(7,5) = -0.91;
A(2,7) = -1;
A(11,10) = -0.16;
A(12,10) = -0.84;
A(13,12) = -0.94;  
A(14,12)= -0.06;
A(9,14) = -1;
A(10,14) = -1;
A(17,16) = -1;
A(17,2) = -conv;
A(18,17) = -1;
matrix = A;

end

