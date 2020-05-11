%HW8Q4

%Plot the uniform distribution described in the text, both as a 2D plot at
% multiple times, and as a 3D plot 
D = (1.1*10^-4) * 100^2;
D2 = (8.4*10^-5)* 100^2;
L = 60;
% change Nf to see different numbers of fourier coefficients
Nf = 100;



%plot in T(t,x) for different times t.
figure(1);
T = @(x,t) HW4Func(Nf, D, x, t);
fsurf(T, [0 60 0 1500]);

title("Temperture Distribution for Copper");
xlabel('distance')
ylabel('time')
zlabel('Temperature')
% get rid of the meshes
shading interp



%%
%plot in T(t,x) for different times t.
figure(2);
T = @(x,t) HW4Func(Nf, D2, x, t);
fsurf(T, [0 60 0 1500]);


title("Temperture Distribution for Aluminum");
ylabel('time')
xlabel('distance')
zlabel('Temperature')
% get rid of the meshes
shading interp



%%ANSWERS 
% Copper: Time = 1059 Sec 
% Aluminum: Time = 1368 Sec