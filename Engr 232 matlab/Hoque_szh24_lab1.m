
%Sancheet Hoque szh24
%Section 67 Lab 1
% June 30, 2017
%%
clc

%%
B=0.5;
k=150;
V=(0:170);
Vprime=[];
for v = 0:170
Vprime(v+1,1)=B*v*log(k/v);
end

x=find(Vprime==0); 

figure

plot(V,Vprime)
hold on
plot([0,V(x)],[0,0],'ro')
grid on
grad=gradient(Vprime);
plot(V,grad)
hold off

title('dV/dt vs V')
xlabel('V')
ylabel('dV/dt')

legend('Original plot', 'Equiblibrium points')

%%
%problem 4
%0 is not stable because on the graph it never reach
%150 is stable because before the value its positive and after it is
%negative. region of attraction is 0 to 150 and 150 to infinity
%%
%problem 5
%NO we can't because we do not have a time value on this graph 

%% 

%problem 8
% according to the grid 0 is unstable because it shows red, while at 150 it
% shows convergence

%problem 9
%It will take about 17 seconds for it to decay

%problem 10
%it will decay much faster as it takes about 6 seconds


