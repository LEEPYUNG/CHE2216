function [matrix] = MatrixMakerRecovery(conv, recov)

%Also not hardcoding this thanks will i suck so much 
A = eye(21,21);
A(2,1) = -1;
A(3,2) = (conv-1);
A(10,2) = -conv;
A(5,3) = -1;
A(6,5) = -0.09;
A(7,5) = -0.91;
A(2,7) = -1;
A(11,10) = -recov;
A(12,10) = -(1-recov);
A(13,12) = -0.94;  
A(14,12)= -0.06;
A(9,14) = -1;
A(10,14) = -1;
A(17,16) = -1;
A(17,2) = -conv;
A(18,17) = -1;
matrix = A;

end

