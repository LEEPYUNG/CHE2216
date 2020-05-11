
% Code to call an integrator for transient 1D partial differential equations

figure(3);
%clf;

% length in x, time simulated, and other constants
Length = 60;
Time   = 500;
dt     = 20;
dx     = 0.1;
k      = 1;
lambda = k*dt/(dx*dx);

%find the number of steps in the t and x direction
nt = ceil(Time/dt) + 1;
nx = ceil(Length/dx) + 1;

% generate the mesh
[t,x] = meshgrid(0:dt:dt*(nt-1),0:dx:dx*(nx-1));


%set the t=0 boundary conditions
tin = linspace(0,dx*(nx-1),nx)';
x0 = 485-15*abs(tin-30); 


xin = linspace(0,dt*(nt-1),nt);
%set the x=0,x=L boundary conditions
b = [35*ones(1,nt);35*ones(1,nt)];
%other x boundary conditions
%b = [100*sin(xin/20);100*cos(xin/20)];
%b = [300*rand(1,nt);300*rand(1,nt)];

%M = explicit_diffusion(x0,b,lambda);
%M = implicit_diffusion(x0,b,lambda);
M = CrankNicholson(x0,b,lambda);

surf(t,x,M,'EdgeColor', 'None')
shading interp

xlabel('time')
ylabel('distance')