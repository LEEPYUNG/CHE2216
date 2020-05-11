%This part is to test the zombie_interest function with inputs 
%P = 100, r = 3,6,9, and i which ranges from 1 to F (the final day). 

%population3,population6,population9 are arrays to store the daily
%population size of zombies for 3%,6%,9%. Because of the situation,
%preallocation was not possible because the size of the array is unknown.

%Create a counter i to use in the while loop. Increment for population
%with 3% increase rate.
 i= 1;
while 1
    %Keep increasing the population if total zombie population is less that
    %7.14 billion. 
   if(zombie_interest(1,3,i) < 7410000000)
     population3(i) = zombie_interest(1,3,i);
     %increment i for the next iteration.
     i = i+1;
   else
       break;
   end
end

%Create a counter i to use in the while loop. Increment for population
%with 3% increase rate.
 i= 1;
while 1
    %Keep increasing the population if total zombie population is less that
    %7.14 billion. 
   if(zombie_interest(1,6,i) < 7410000000)
     population6(i) = zombie_interest(1,6,i);
     %increment i for the next iteration.
     i = i+1;
   else
       break;
   end
end

%Create a counter i to use in the while loop. Increment for population
%with 3% increase rate.
 i= 1;
while 1
    %Keep increasing the population if total zombie population is less that
    %7.14 billion.
   if(zombie_interest(1,9,i) < 7410000000)
     population9(i) = zombie_interest(1,9,i);
     %increment i for the next iteration.
     i = i+1;
   else
       break;
   end
end

%Create the array where the days can be plotted on the y-axis using the
%size of population 3 as basis.
[m,n] = size(population3);
days3 = (1:n);

%Create the array where the days can be plotted on the y-axis using the
%size of population 6 as basis.
[m,n] = size(population6);
days6 = (1:n);

%Create the array where the days can be plotted on the y-axis using the
%size of population 9 as basis.
[m,n] = size(population9);
days9 = (1:n);



%%

%Ploting days vs population created above. With xlabel, ylabel, and title.

%hold on command is used to overlay the three plots.
hold on
%Plotted the population with 3% rate with solid green line.
plot(days3,population3, 'g');
ylabel("Population");
%Plotted the population with 6% rate with dotted green line.
plot(days6,population6, ':g');
% %Plotted the population with 6% rate with dashed green line.
plot(days9,population9, '--g');
xlabel("Days after outbreak");
title("Daily Zombie Population with Varying Increase Rate");
%hold off command is used to stop overlaying the plots.
hold off

