clear;clc;
%Define f(t,w)
f = @(t,w)w/t - (w/t)^2;

%Inilization
h = 0.1;
t = ones(11,1);
t(1) = 1;
for i = 1:10
    t(i + 1) = 1 + 0.1*i;
end
w = ones(11,1); %approxiated value
w(1) = 1;   %initial value
y = t./(1 + log(t)); %exact value

%Solve for w(2)
for i = 1:1
    k1 = h*f(t(i),w(i));
    k2 = h*f(t(i) + h/2,w(i) + k1/2);
    k3 = h*f(t(i) + h/2,w(i) + k2/2);
    k4 = h*f(t(i) + h,w(i) + k3);
    w(i + 1) = w(i) + 1/6*(k1 + 2*k2 +2*k3 + k4);
end

for i = 2:10
    w(i + 1) = w(i) + h*(3/2*f(t(i),w(i)) - 1/2*f(t(i - 1),w(i - 1)));
end

error = y - w;

%Plot the results
plot(t,y,'-o',t,w,'--x');
plot(t,error);