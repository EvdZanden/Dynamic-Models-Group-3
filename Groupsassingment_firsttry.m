%% Three species model


t0 = 0;                 	% start time of simulation [in months]
tfinal = 90;                % end time of simulation [in months]
y0 = [3 0.5 ];               % initial state i.e. number of tuna and sharks at t=0
tspan = [t0 tfinal];        % time span defined by the start and end times of the simulation [in months]
a1 = 5;                    %maximum consumption rate of plants
a2 = 0.1;                    %maximum consumption rate of hare
b1 = 3;                      %strength of saturation of hare
b2 = 2;                      %strength of saturation of lynx
d1 = 0.4;                      %per capita death rate hare
d2 = 0.01;                      %per capita death rate lynx


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


