%3th and 6th Lagrange_Interpolation
%Initialization
clear;
clc;
n1 = 3;  %order of Lagrange interpolation polynomials
n2 = 6;
fappx1 = appx(n1);
fappx2 = appx(n2);

%evaluate the value of original and approximation function
t = 0:0.01:2;
yoriginal = fvalue(t);
y1 = eval(fappx1);
y2 = eval(fappx2);

%plot the above functions
plot(t,yoriginal,'LineWidth',2);
hold on;
plot(t,y1,'--or','LineWidth',2);
plot(t,y2,'--xg','LineWidth',2);
axis([0 2 -1.1 1.1]);
xlabel('x');
ylabel('f(x)');
legend('Original function','3rd approximation','6th approximation');

%plot the errors
hold off
plot(t,yoriginal - y1,'--or','LineWidth',2);
hold on;
plot(t,yoriginal - y2,'--xg','LineWidth',2);
xlabel('x');
ylabel('f(x) - fappx(x)');
legend('3rd approximation','6th approximation');