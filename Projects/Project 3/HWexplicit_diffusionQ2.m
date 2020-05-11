function [ M, nCount] = HWexplicit_diffusionQ2(x0,b,lambda,dt)

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

%Allocate an array for the n for each cell
nCount = zeros(nx,nt);
for i = 1:30
    nCount(i,1) = 0.98;
end
for i = 31:nx
    nCount(i,1) = 0.98;
end

%Parameters 
deltaT = dt;
kflux = 8.25;
u = 0.56;
v1 = 0.89;
b = 0.1;
y = 2.0;
k1 = 0.63;
ky = 0.1;
U = 1;
Cin = 2;
D = 10;

%Derivative values for the bounds, but this situation its 0. So it's not
%utilized.
%lNewman = 0;
%rNewman = 0;

%Calcualting constant for term2.
term2 = deltaT * kflux * u;

%Loop to find Concentration + n explicitly.
%Find n for the next term and then concentration for the next term.
for col=1:nt-1
  
    %For the x = 0 boundary.
    nCount(1, col+1) = nFoward(nCount(1,col),M(1,col),deltaT);
    M(1,col+1) = (M(1,col) + lambda*( M(2,col) -2*M(1,col)+ (M(1,col)-2*((U*M(1,col)-Cin*U)/D))) + (term2 *(nCount(1,col))*(b+(v1*M(1,col)/(k1 +M(1,col))))) - (deltaT*(y*M(1,col)/(M(1,col)+ky))) +  (-U*deltaT*(M(2,col)-M(1,col))));
    
    %For the interior points.
    for row=2:nx-1
        nCount(row, col+1) = nFoward(nCount(row,col),M(row,col),deltaT);
        M(row,col+1) = (M(row,col) + lambda*( M(row+1,col) -2*M(row,col)+ M(row-1,col)) + (term2 *(nCount(row,col))*(b+(v1*M(row,col)/(k1 +M(row,col)))) ) - (deltaT*(y*M(row,col)/(M(row,col)+ky))) + (-U*deltaT*(M(row+1,col)-M(row,col)))   );
    end
    
    %For the x = 250 boundary.
    nCount(nx, col+1) = nFoward(nCount(nx,col),M(nx,col),deltaT);
    M(nx,col+1) = (M(nx,col) + lambda*( M(nx-1,col) -2*M(nx,col)+ M(nx-1,col)) + (term2 *nCount(nx,col)*(b+(v1*M(nx,col)/(k1 +M(nx,col))))) - (deltaT*(y*M(nx,col)/(M(nx,col)+ky))) );
   
end

end