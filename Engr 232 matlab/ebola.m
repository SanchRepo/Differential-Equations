function [dydt] = ebola(t,P)
dydt = .04*P*(1-P); 
end