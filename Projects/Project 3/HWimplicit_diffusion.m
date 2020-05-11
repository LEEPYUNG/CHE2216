function [ M ] = HWimplicit_diffusion(x0,b,lambda, dt)

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

 %Parameters 
deltaT = dt;
kflux = 8.25;
u = 0.56;
v1 = 0.89;
b = 0.1;
y = 2.0;
k1 = 0.63;
ky = 0.1;

%Calcualting constant for term2.
term2 = deltaT * kflux * u;

%Allocate an array for the n for each cell
nCount = zeros(nx,nt);
for row = 1:30
    nCount(row,1) = 0.1;
end
for row = 31:nx
    nCount(row,1) = 0.98;
end

%set the initial conditions
M(:,1)  = x0;

%Sets up the A matrix
A(1,1) = (1+2*lambda); 
A(1,1+1) = (-2*lambda); 
A(nx,nx-1) = (-2*lambda);
A(nx,nx) = (1+2*lambda);

for row=2:nx-1
    A(row,row-1) = -lambda;
    A(row,row)   = 1+2*lambda;
    A(row,row+1) = -lambda;    
end

%Calculating B vector and filling out the M matrix
for col=1:nt-1
    for row=1:nx
        B(row)  = M(row,col) +(term2 *(nCount(row,col))*(b+(v1*M(row,col)/(k1 +M(row,col))))) - (deltaT*(y*M(row,col)/(M(row,col)+ky)));
        nCount(row, col+1) = nFoward(nCount(row,col),M(row,col),deltaT); %Find n for next time spot.
    end
    M(:,col+1) = A\B;    
end

end