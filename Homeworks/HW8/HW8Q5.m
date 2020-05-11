%HW8Q5
%Plot the uniform distribution described in the text, both as a 2D plot at
% multiple times, and as a 3D plot 
x = 0:0.01:20;
y = 0:0.01:10;
% change Nf to see different numbers of fourier coefficients
Nf = 100;
L = 20;

%plot in T(t,x) for different times t.
figure(1);
[X,Y] = meshgrid(x,y);
T = HW5Func(Nf, X, Y);
surf(x,y,T);
title("Temperture Distribution");
xlabel('x')
ylabel('y')
zlabel('Temp')
% get rid of the meshes
shading interp

