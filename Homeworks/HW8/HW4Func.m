function T = HW4Func(n, D, x, t)
T = 0; %Initial/Starting Value

for i = 1:n %go to number of terms  
    An = (2*sin(30*pi*i/60)-sin(60*pi*i/60))/(2*(pi*i/60)^2); %Fourier Series
    T = T + exp(-D*(pi*i/60)^2*t)*An*sin(x*pi*i/60); %Adding the Susm again
end
T = T+35; %Adding the 35 back in
end