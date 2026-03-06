%% Three species model Scenario 1
% Stable oscillations with a periodicity of apporxiamately 70 months
% We changed the strength of saturation of the lynx to a lower number this
% results in more time between the oscillations since the lynx are
% saturated earlier, thus eat less hare per time period.


t0 = 0;                 	% start time of simulation [in months]
tfinal = 300;               % end time of simulation [in months]
y0 = [0.75 0.25 8];         % initial state i.e. number of plants, hare and lynx at t=0
tspan = [t0 tfinal];        % time span defined by the start and end times of the simulation [in months]
a1 = 5 ;                    % maximum consuption rate plants-hare
a2 = 0.1;                   % maximum consuption rate hare-lynx
b1 = 3 ;                    % strength of saturation hare
b2 = 1.31;                  % strength of saturation lynx
d1 = 0.4;                   % per capita death rate hare
d2 = 0.01;                  % per capita death rate lynx

% Simulate Model

[t,y] = ode23(@(t,y) plants_hare_lynx(t,y,a1,a2,b1,b2,d1,d2), tspan, y0);

% plotting the population over time
figure("Name",'Plants-Hare-Lynx')
plot(t,y)
title('Plants/Hare/Lynx Populations Over Time')
xlabel('Time [months]')
ylabel('Population')
legend('Plants','Hare','Lynx', 'Location','North')

% plotting the state space
figure("Name",'State Space')
plot3(y(:,1),y(:,2), y(:,3))
title('State space')
xlabel('Plants Population')
ylabel('Hare Population')
zlabel('Lynx Population')