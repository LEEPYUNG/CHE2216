function  [ x ] = GaussNaive( A,b )
%GaussNaive : Naive Gauss Elimination
% x = GaussNaive(A,b): Gauss elimination without pivoting
% input: 
%   A = coefficient matrix
%   b = right hand side vector
% output:
%   x = solution vector

[m,n] = size(A);
if m ~= n
     error('Matrix A must be square');
end
nb = n+1; % To account for vector augmentation
Aug = [A b]; % Augment vector, now (n+1)x(n)

% Forward elimination
for k=1:n-1 % first loop; loop over columns
            % Chooses variable x_k each loop
            % last column does not need operation of removing variable
    for i = k+1:n % second loop: loop over rows
                  % want to remove chosen variable x_k from each row below
                  % row k
        factor = Aug(i,k)/Aug(k,k); % factor that you want to multiply row k 
                                    % with so that the variable x_k is
                                    % removed from the lower rows
                                    % changes with each row from K+1  -- n
        Aug(i,k:nb) = Aug(i,k:nb)-factor*Aug(k,k:nb); % third loop
        % new matrix after subtracting eqn k from eqn (k+1) to eqn (n)
        % gets rid of variable x_k from all lower rows 
    end
end

disp(Aug);

%back substitution
x = zeros(m,1); %preallocation
x(n) = Aug(n,nb)/Aug(n,n); %get last value first as c1*x_n = c2*b_n
for i = n-1:-1:1  % first loop, reverse loop over variables
    x(i) = (Aug(i,nb) - Aug(i,i+1:n)*x(i+1:n))/Aug(i,i); % second loop
    %subtract value in b vector, i_th row
    % with all solved values of x's multiplied by their coefficients in the
    % matrix
    % then divide everything by the coefficient for the chosen variable x_i
    
end