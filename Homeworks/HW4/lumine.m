function  [ L, U ] = lumine( A )
%lumine : LU Decompostion
% L, U = lumine(A): returns Lower and Upper Triangular Matrixes
% input: 
%   A = coefficient matrix
% output:
%   L = Lower Triangular 
%   U = Upper Triangular Matrix



[m,n] = size(A);
if ((m ~= n) || (det(A) == 0))
     error('Matrix A must be square');
end
%nb = n+1; % To account for vector augmentation
Upper = (A); %Make upper matrix as A - you will update this as loop begins.
Lower = eye(n); %Create a diagonal matrix with ones on the diagonal and 0 everywhere else.

% Forward elimination - Creates the Upper/Lower Triangular Matrix.
for k=1:n-1 % first loop; loop over columns
            % Chooses variable x_k each loop
            % last column does not need operation of removing variable
    for i = k+1:n % second loop: loop over rows
                  % want to remove chosen variable x_k from each row below
                  % row k
        factor = Upper(i,k)/Upper(k,k); % factor that you want to multiply row k 
                                    % with so that the variable x_k is
                                    % removed from the lower rows
                                    % changes with each row from K+1  -- n
        Upper(i,k:n) = Upper(i,k:n)-factor*Upper(k,k:n); % third loop
        % new matrix after subtracting eqn k from eqn (k+1) to eqn (n)
        % gets rid of variable x_k from all lower rows 
        
        Lower(i,k) = factor; %Set the corresponding spots of the lower matrix to the factor.
    end
end

%Displaying Lower and Upper triangular Matrices 
L = Lower;
U = Upper;
% 
disp("LOWER: ");
disp(L);
disp("Upper: ");
disp(U);







