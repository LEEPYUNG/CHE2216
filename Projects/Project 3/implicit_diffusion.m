function [ M ] = implicit_diffusion(x0,b,lambda)

% implicit diffusion, with arbitrary Dirichlet boundary conditions
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
%allocate the solution matrix for point j+1
A = zeros(nx,nx);
B = zeros(nx,1);

%set the initial conditions
M(:,1)  = x0;

A(1,1) = 1;
A(nx,nx) = 1;

for i=2:nx-1
    A(i,i-1) = -lambda;
    A(i,i)   = 1+2*lambda;
    A(i,i+1) = -lambda;    
end

for j=1:nt-1
%set the x=0 boundary conditions at t=j+1
    B(1)   = b(1,j+1);
%set the x=n boundary conditions at t=j+1
    B(nx)  = b(2,j+1);
    for i=2:nx-1
        B(i)     = M(i,j);
    end
    M(:,j+1) = A\B;    
end

end