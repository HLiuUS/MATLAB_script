clear;clc;
%Define f(t,w)
f = @(t,w)t*exp(3*t) - 2*w;

%Inilization
h = 0.1;
t = ones(11,1);
t(1) = 0;
for i = 1:10
    t(i + 1) = 0.1*i;
end
w = ones(11,1); %approxiated value
w(1) = 0;   %initial value
y = 1/5*t.*exp(3*t) - 1/25*exp(3*t) + 1/25*exp(-2*t); %exact value

%Solve for w
for i = 1:10
    k1 = h*f(t(i),w(i));
    k2 = h*f(t(i) + h/2,w(i) + k1/2);
    k3 = h*f(t(i) + h/2,w(i) + k2/2);
    k4 = h*f(t(i) + h,w(i) + k3);
    w(i + 1) = w(i) + 1/6*(k1 + 2*k2 +2*k3 + k4);
end
error = y - w;

%Plot the results
plot(t,y,'-o',t,w,'--x');