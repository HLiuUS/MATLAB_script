%Natural_Cubic_Spline
%Initialization
clear;
clc;
n = 10; %number of intervals
h = 2/n;  %length of intervals
x = 0:h:2;
a = fvalue(x);  %solve for a

%Build the tri-diagonal system
H = zeros(n + 1);
H(1,1) = 1;
H(n + 1,n + 1) = 1;
for j = 1:n - 1 %lower diagonal
    H(j + 1, j) = h;
end
for j = 3:n + 1 %upper diagonal
    H(j - 1, j) = h;
end
for j = 2:n %main diagonal
    H(j,j) = 4*h;
end
A(1) = 0;
A(n + 1) = 0;
for i = 2:n
    A(i) = 3/h*(a(i + 1) - a(i)) - 3/h*(a(i) - a(i - 1));
end
A = A';    

%solve for c
c = H\A;

%solve for b and d
for k = 1:n
    b(k) = (a(k + 1) - a(k))/h - h/3*(2*c(k) + c(k + 1));
    d(k) = (c(k + 1) - c(k))/3/h;
end

%build the matrix of s
s = sym(zeros(n,1));
syms t
for k = 1:n
    s(k) = a(k) + b(k)*(t - x(k)) + c(k)*(t - x(k))^2 + d(k)*(t - x(k))^3;
end

for i = 1:n
    t1 = 0.2*(i - 1);
    t2 = 0.2*i;
    t = t1:0.01:t2;
    yoriginal = fvalue(t);
    y = eval(s(i));
    plot(t,yoriginal,'LineWidth',2);
    plot(t,y,'--og','LineWidth',2);
    hold on;
    xlabel('x');
    ylabel('f(x)');
    legend('Original Function','Natural Cubic Spline');
end

for i = 1:n
    t1 = 0.2*(i - 1);
    t2 = 0.2*i;
    t = t1:0.01:t2;
    yoriginal = fvalue(t);
    y = eval(s(i));
    error = yoriginal - y;
    plot(t,error,'r','LineWidth',2);
    hold on;
    xlabel('x');
    ylabel('f(x) - fappx(x)');
end