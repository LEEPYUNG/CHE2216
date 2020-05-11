function  [x] = lusolve(L,U,B)
%lusolve : Solve the matrix equation with LU decomposition.
% input: 
%   L = Lower Triangular 
%   U = Upper Triangular Matrix
% output:
%   x = vector with the answers to the equation solver.

%[A]x = b 
% %We have...[A] = [L][U]
% %[L][U]x = b 
% %If we let [U]x = d....then we simplify to...
% %[L]d = b.

% %Solve for d vector.
d = GaussNaive(L,B);
 
%Then we solve for x... [U]x = d
% %Now we solve for x vector using d.
x = GaussNaive(U,d);

 disp("This is the final answer: ");
 disp(x);



