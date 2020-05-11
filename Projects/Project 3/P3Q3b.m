% Code to call an integrator for transient 1D partial differential equations


figure(5);
clf;

% length in x, time simulated, and other constants
Length = 250;
Time   = 100;
dt     = 0.05;
dx     = 1;
D      = 10;
lambda = D*dt/(dx*dx);

%find the number of steps in the t and x direction
nt = Time/dt + 1;
nx = Length/dx + 1;

% generate the mesh
[t,x] = meshgrid(0:dt:dt*(nt-1),0:dx:dx*(nx-1));

%set the t=0 Initial Conditions
xin = linspace(0,dx*(nx-1),nx)';

%Setting Initial Conditions of c = 2 (from x = 0 to 30) and c = 0.1 (from x = 31 to end)
for i = 1:30
    x0(i,1) = 2;
end
for i = 31:nx
    x0(i,1) = 0.1;
end

%set the x=0,x=L boundary conditions
b = [0*ones(1,nt);0*ones(1,nt)]; 
[M] = HWimplicit_diffusion(x0,b,lambda,dt);


%Plotting 3D
surf(t,x,M,'EdgeColor', 'None')
title("Concentration of Calcium ions");
xlabel('time')
ylabel('distance')
zlabel('concentration')
shading interp


