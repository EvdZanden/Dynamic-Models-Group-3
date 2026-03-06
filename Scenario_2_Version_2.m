%% Scenario 2: The lynx population goes extinct (population very close to zero) after a year, and plants and hares stabilize within 120 months
%Setting d2 to a higher number eliminates the lynx, decreasing a1 gives the plants time to regenerate at approximately same rate as hare consume them
%which leads to the populations stabilize without oscilations

t0 = 0;                 	% start time of simulation [in months]
tfinal = 150;                % end time of simulation [in months]
y0 = [1 0.5 0.1];               % initial state i.e. number of plants, hare and sharks
tspan = [t0 tfinal];        % time span defined by the start and end times of the simulation [in months]
a1 = 0.4;                    %maximum consumption rate of plants
a2 = 0.1;                    %maximum consumption rate of hare
b1 = 2;                      %strength of saturation of hare
b2 = 5;                      %strength of saturation of lynx
d1 = 0.1;                      %per capita death rate hare
d2 = 0.1;                      %per capita death rate lynx


[t,y] = ode23(@(t,y) plants_hare_lynx(t,y,a1,a2,b1,b2,d1,d2), tspan, y0);

% plotting the population over time
figure("Name",'Plants-Hare-Lynx')
plot(t,y)
title('Plants/Hare/Lynx Populations Over Time')
xlabel('Time [months]')
ylabel('Population')
legend('Plants','Hare','Lynx', 'Location','North')

% Now, we are also going to plot the state space:
% plotting the state space
figure("Name",'State space')
plot3(y(:,1),y(:,2), y(:,3))
title('State space')
xlabel('Plants Population')
ylabel('Hare Population')

zlabel('Lynx Population')


