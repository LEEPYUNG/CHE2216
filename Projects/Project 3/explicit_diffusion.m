function [ M ] = explicit_diffusion(x0,b,lambda)

% Explicit diffusion, with arbitrary Dirichlet boundary conditions
% 
% x0 is the vector of intial postions (at t=0) 
% b is a 2-column vector.  the first column is the left side, the second
% column is the right side
%

%find the size of the b.c. arrays
nt = max(size(b));
nx = max(size(x0)); 

%allocate the matrix of the solutions
M = zeros(nx,nt);

%set the edges
M(1,:)  = b(1,:);
M(nx,:) = b(2,:);
M(:,1)  = x0;


for col=1:nt-1
    for row=2:nx-1
        M(row,col+1) = M(row,col) + lambda*( M(row+1,col) -2*M(row,col)+ M(row-1,col));
        disp("row:" + row  + " and col: " + col);
    end
end

end