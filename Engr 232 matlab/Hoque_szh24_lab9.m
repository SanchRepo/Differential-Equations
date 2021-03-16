%Sancheet Hoque szh24
%Section 67 Lab 7
% August 25, 2017
%%
clc,clear,close

%% 1
A = [0 1 ; -10 -2];
B = [0; 1];
x0 = [0 ;0];

evalues=eig(A);


%% 2
syms s

Us = (1/s-exp(-5*s)/s);
Xs = inv(s*eye(2)-A)*x0+ inv(s*eye(2)-A)*B*Us;

X1s = simplify(Xs(1,1));
X2s = simplify(Xs(2,1));

x1t = ilaplace(X1s);
x2t = ilaplace(X2s);
Ust = ilaplace(Us);

%% 3
IC = x0;

ep = inv(A)*-B;
x1 = matlabFunction(x1t); % make functions to plot
x2 = matlabFunction(x2t);
U = matlabFunction(Ust);

t = 0:0.01:15;



%% 4
figure
subplot(3,1,1)
plot(t,x1(t),'r', 'linewidth', 2)
grid on; ylabel('x_1(t)')
title('Component Plots')

subplot(3,1,2)
plot(t,x2(t),'b', 'linewidth', 2)
grid on; ylabel('x_2(t)')
xlabel('t')

subplot(3,1,3)
plot(t,U(t),'b', 'linewidth', 2)
grid on; ylabel('U(t)')
xlabel('t')

%% 5
figure
plot(x1(t),x2(t),'g', 'linewidth', 2)
hold on, plot(IC(1),IC(2),'b*',ep(1),ep(2),'k*')
plot(ep(1),ep(2),'ko')
hold off
xlabel('x_1(t)'), ylabel('x_2(t)')
title('Phase Plot')
legend('Analytical Trajectory','Initial Condition',...
 'Eq Point','Location','best')

grid on



%% Summary Cell

%a. Discuss the direction of the phase plot with respect to its starting point, where the
%pulse turns off and at its final value.

%in the beginning it goes to the up and right starting that arch shape. It
%then circles all the way to the end point which is .1 where it turns off

%b. Estimate the time for x1(t) to go to zero after the pulse is removed.
% about 7.5

%c. Estimate the time for x2(t) to go to zero after the pulse is removed.
% about 7.6 