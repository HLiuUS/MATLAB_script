clear;clc

a = 0;
b = 1;
u = [-0.7745966692 0 0.7745966692];
c = [0.5555555555 0.8888888888 0.5555555555];
I = 0;

for i = 1:3
    I = I + 0.5*c(i)*fvalue42(u(i));
end