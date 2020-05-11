function T = HW5Func(n, x, y)
T = 0; %Initial/Starting Value

for i = 1:n %go to number of terms  
    An = (200/(pi.*i)).*(cos(i.*pi)-1)./(cosh(i.*pi./2)); 
    T = T + sin((pi*i/20).*x).*An.*cosh((i*pi/20).*(10-y)); %Adding the Sum again
end
T = T+400; %Adding the 400 back in
end