
%Sancheet Hoque szh24
%Section 67 Lab 3
% July 14, 2017
%%
clc,clear,close
%%
%% Euler's Method
dt1 = 10;
dt2 = 5;
dt3 = 1;
PI = 3/15000;
tI = 0;
tEnd = 500;
% Define time points and solution vector
tSpan1 = tI:dt1:tEnd;
tSpan2 = tI:dt2:tEnd;
tSpan3 = tI:dt3:tEnd;
P1 = zeros(size(tSpan1));
P2 = zeros(size(tSpan2));
P3 = zeros(size(tSpan3));
% Initialize the solution at the initial conditions
P1(1) = PI;
P2(1) = PI;
P3(1) = PI;
% Implement Euler's method
for i=2:length(tSpan1)
yprime = ebola(tSpan1(i-1),P1(i-1));
P1(i) = P1(i-1) + dt1*yprime;
end 

for i=2:length(tSpan2)
yprime2 = ebola(tSpan2(i-1),P2(i-1));
P2(i) = P2(i-1) + dt2*yprime2;
end

for i=2:length(tSpan3)
yprime3 = ebola(tSpan3(i-1),P3(i-1));
P3(i) = P3(i-1) + dt3*yprime3;
end 

figure(1)
plot(tSpan1,P1,'g')
grid on
xlabel('Time')
ylabel('P(t)') 
hold on 
plot(tSpan2,P2,'r')
plot(tSpan3,P3,'black')


%% Runga Kutta

for i=2:length(tSpan2)
yprime = ebola(tSpan2(i-1),P2(i-1));
yo = ebola(tSpan2(i),P2(i));
kn = ebola(tSpan2(i)+dt2/2,P2(i)+(dt2/2)*(yo));
P2(i) = P2(i-1) + dt2*kn;
end 

plot(tSpan2,P2,'y')








%% ODE 45
[t_ode45, y_ode45] = ode45(@ebola,tSpan2, PI);
plot(t_ode45,y_ode45,'b--o')

%% Actual

for j =1:length(tSpan2)
  exp1=exp((.04)*tSpan2(j));
  yactual(1,j)=exp1/(exp1+4999)  
end
plot(tSpan2,yactual,'c*')

legend('Eulers Method 10','Eulers Method 5 ','Eulers Method 4' 'ODE45', 'Actual')


%% MSE for euler and ode45

error = y-yactual;
sq=error.^2;
Mse_Euler=mean(sq)

error = y_ode45'-yactual;
sq=error.^2;
Mse_Ode45=mean(sq)

