function xdot = matrixcof(t,x)
x1=x(1,1);
x2=x(2,1);

xdot(1,1)=x2;
xdot(2,1)= -x2+6*x1+exp(-t)*cos(t);