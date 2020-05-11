% Code to call an integrator for transient 1D partial differential equations

figure(1);
clf;

% length in x, time simulated, and other constants
Length = 250;
Time   = 100;
dt     = 0.01;
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
[M, N] = HWexplicit_diffusion(x0,b,lambda, dt);


%Plotting 3D
surf(t,x,M,'EdgeColor', 'None')
title("Concentration of Calcium ions");
xlabel('time')
ylabel('distance')
zlabel('concentration')
shading interp

figure(4);
surf(t,x,N,'EdgeColor', 'None')
title("Fraction of IP3R Pumps");
shading interp
xlabel('time')
ylabel('distance')
zlabel('concentration')

% Plotting c vs x
figure(2);
x = linspace(0,250,251);
plot(x,M(:,1));
hold on
plot(x,M(:,2001));
plot(x,M(:,4001));
plot(x,M(:,6001));
plot(x,M(:,8001));
plot(x,M(:,10001));
hold off
legend("Time 0","Time 20","Time 40","Time 60","Time 100");
xlabel("X");
ylabel("Concentration");
title("Concentration of Calcium ions over X");
% Plotting n vs x
figure(3);
xlim([0,251]);
ylim([0,1]);
plot(x,N(:,1));
hold on
plot(x,N(:,2001));
plot(x,N(:,4001));
plot(x,N(:,6001));
plot(x,N(:,8001));
plot(x,N(:,10001));
hold off
legend("Time 0","Time 20","Time 40","Time 60","Time 100");
xlabel("X");
ylabel("Fraction of pumps open (n)");
title("Fraction of pumps open (n) over X");





