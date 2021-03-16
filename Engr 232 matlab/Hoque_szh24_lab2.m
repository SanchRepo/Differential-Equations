
%Sancheet Hoque szh24
%Section 67 Lab 2
% July 7, 2017
%%
clc,clear,close

%% Euler's Method
dt = 0.2;
yI = 1;
tI = 0;
tEnd = 6;
% Define time points and solution vector
tSpan = tI:dt:tEnd;
y = zeros(size(tSpan));
% Initialize the solution at the initial conditions
y(1) = yI;
% Implement Euler's method
for i=2:length(tSpan)
yprime = ode_eulerf(tSpan(i-1),y(i-1));
y(i) = y(i-1) + dt*yprime;
end 

figure(1)
plot(tSpan,y,'g')
grid on
xlabel('Time')
ylabel('y(t)') 
hold on 

%% ODE 45
[t_ode45, y_ode45] = ode45(@ode_eulerf,tSpan, yI);
plot(t_ode45,y_ode45,'b--o')

%% Actual

for j =1:length(tSpan)
  yactual(1,j)=3-(6/(exp(tSpan(j))+2));  
end
plot(tSpan,yactual,'c*')

legend('Eulers Method', 'ODE45', 'Actual')


%% MSE for euler and ode45

error = y-yactual;
sq=error.^2;
Mse_Euler=mean(sq)

error = y_ode45'-yactual;
sq=error.^2;
Mse_Ode45=mean(sq)


%% Equilibrium

%problem 2 
%if you look at the dy/dt equation you can see that
%0 and 3 and equilibrium by solving for zero. On the plot the values
%converse to 3, so that is a stable point!

%problem 3
% I looked the yactual array and looked at the index where it equals 1.4
% and 2.4. I then look at the time and match that up. t=.5 for y=1.4 and
% t=2.1 for y=2.4. So 2.1 - .5 = 1.6. So it took about 1.6 unites of time.

