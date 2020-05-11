% Code to call an integrator for transient 1D partial differential equations

figure(1);
clf;

% length in x, time simulated, and other constants
Length = 8;
Time   = 20;
dt     = 0.1;
dx     = 2;
k      = 1;
lambda = k*dt/(dx*dx);
disp(lambda);

%find the number of steps in the t and x direction
nt = Time/dt + 1;
nx = Length/dx + 1;

% generate the mesh
[t,x] = meshgrid(0:dt:dt*(nt-1),0:dx:dx*(nx-1));


%set the t=0 Initial Conditions
xin = linspace(0,dx*(nx-1),nx)';
x0 = 0*xin; %Initial Conditions 

%set the x=0,x=L boundary conditions
b = [10*ones(1,nt);10*ones(1,nt)]; 

M = implicit_diffusion(x0,b,lambda);

disp(M) 

surf(t,x,M,'EdgeColor', 'None')
shading interp

xlabel('time')
ylabel('distance')
zlabel('temperature')