%Sancheet Hoque szh24
%Section 67 Lab 7
% August 11, 2017
%%
clc,clear,close


%% a
%a. u(t)=(s+1)/((s+1)^2+1)

    %y''= s^2y(s)-s-1
    %y'=sy(s)-1
    %y=y(s)
    
    %u(s)=s^2y(s)-s-1+sy(s)-1-6y(s)
    %u(s)=y(s)(s^2+s-6)
    %y(s)=((s+1)/((s+1)^2)*(s^2+s-6))+(s+2/(s^2+s-6))
    
%% b

syms s t
y1=simplify(((s+1)/((s+1)^2)*(s^2+s-6))+(s+2/(s^2+s-6)));
y1a=ilaplace(y1)
y1b = ilaplace(((s+1)/((s+1)^2)*(s^2+s-6))+(s+2/(s^2+s-6)))

%% c 

type matrixcof

[t_ode45, y_ode45] = ode45(@matrixcof,[0:0.1:4], [1,1]);


figure 

subplot(2,2,1)
plot(t_ode45,y_ode45(:,1))
title('y(t) vs t')
ylabel('y(t)')
xlabel('time')
hold on

subplot(2,2,3)
plot(t_ode45,y_ode45(:,2))
title('y''(t) vs t')
ylabel('y''(t)')
xlabel('time')
hold on

subplot(2,2,[2,4])
plot(y_ode45(:,1), y_ode45(:,2))
title('y''(t) vs y(t)')
xlabel('y(t)')
ylabel('y''(t)')
hold on

%% d

ysolve = dsolve('Dy2+Dy-6*y == exp(-t)*cos(t), y(0)==1, Dy(0)==1');








