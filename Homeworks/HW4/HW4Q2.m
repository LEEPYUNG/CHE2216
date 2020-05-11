%Tests lumine.m and lusolve.m. 

A = [2 1 -1;4 0 2;8 1 0]; %Create matrix A.
b = [-1;-2;-3]; %Create matrix b.

[L,U] = lumine(A); %Find lower and upper triangular matrix.
x = lusolve(L,U,b); %Solve for the final vector answer.

%Display answers.
disp("This is the vector solution: ");
disp(x);

%%
%
%Part 2e
e = [4;-2;3]; %Create b vector.
ansE = lusolve(L,U,e); %Solve for the final vector.

%Display answers.
disp("This is the vector solution for new vector: ");
disp(ansE);

