%% Scenario 3: The system shows chaotic behavior, and the lynx population peaks twice within the 200-month period. 
% The initial conditions where taken from the book, changed d2 to make the lynx population peak twice during the 200 months period.
% To prove that it is chaotic we showed that the system is sensitive to initial conditions by slightly changing d2 at plotting the two
%systems against eachother. Additionally, we showed that it is deterministic by creating Poincaré plots for each species (xn vs xn+1 plots), since 
%they had a distictive shape the system is deterministic. 


t0 = 0;                 	% start time of simulation [in months]
tfinal = 200;                % end time of simulation [in months]
y0 = [0.75 0.15 8];               % initial state i.e. number of plants, hare and lynx at t0
tspan = [t0 tfinal];        % time span defined by the start and end times of the simulation [in months]
a1 = 5;                    %maximum consumption rate of plants
a2 = 0.1;                    %maximum consumption rate of hare
b1 = 3;                      %strength of saturation of hare
b2 = 2;                      %strength of saturation of lynx
d1 = 0.4;                      %per capita death rate hare
d2 = 0.011;                      %per capita death rate lynx


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

%% Proving that it is sensetive to initial conditions by changing d2

t0 = 0;                 	% start time of simulation [in months]
tfinal = 200;                % end time of simulation [in months]
y0 = [0.75 0.15 8];               % initial state
tspan = [t0 tfinal];        % time span defined by the start and end times of the simulation [in months]
a1 = 5;                    %maximum consumption rate of plants
a2 = 0.1;                    %maximum consumption rate of hare
b1 = 3;                      %strength of saturation of hare
b2 = 2;                      %strength of saturation of lynx
d1 = 0.4;                      %per capita death rate hare
d2 = 0.011;                      %per capita death rate lynx

d2_1 = 0.012;                      %per capita death rate lynx


[t,y] = ode23(@(t,y) plants_hare_lynx(t,y,a1,a2,b1,b2,d1,d2), tspan, y0);
[t1, y1] =  ode23(@(t,y) plants_hare_lynx(t,y,a1,a2,b1,b2,d1,d2_1), tspan, y0);
% plotting the population over time

figure("Name",'Plants-Hare-Lynx')
plot(t,y, '-')
hold on
plot(t1, y1, '--') %new initial conditions in dashed line
hold off
title('Plants/Hare/Lynx Populations Over Time Sensetivity to initial conditions')
xlabel('Time [months]')
ylabel('Population')
legend('Plants','Hare','Lynx', 'Plants new','Hare new','Lynx new')




%% Proving that it is deterministicby creating Poincaré plots for each species

% Extract species
plants = y(:,1);
hare   = y(:,2);
lynx   = y(:,3);

% Create xn and xn+1 pairs
plants_n  = plants(1:end-1);
plants_n1 = plants(2:end);

hare_n  = hare(1:end-1);
hare_n1 = hare(2:end);

lynx_n  = lynx(1:end-1);
lynx_n1 = lynx(2:end);

% Plot xn vs xn+1 for each species
figure("Name",'xn vs xn+1 plots')

subplot(1,3,1)
plot(plants_n, plants_n1,'.')
title('Plants: x_n vs x_{n+1}')
xlabel('x_n')
ylabel('x_{n+1}')

subplot(1,3,2)
plot(hare_n, hare_n1,'.')
title('Hare: x_n vs x_{n+1}')
xlabel('x_n')
ylabel('x_{n+1}')

subplot(1,3,3)
plot(lynx_n, lynx_n1,'.')
title('Lynx: x_n vs x_{n+1}')
xlabel('x_n')
ylabel('x_{n+1}')


