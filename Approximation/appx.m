%This routine is to solve for the approximation function

function fappx = appx(n)
l = sym(ones(n + 1,1));  %Lagrange multipliers
x = zeros(1, n + 1);    %x values of data points
y = zeros(1, n + 1);    %y values of data points

%solve for data point
for i = 1:n + 1
    x(i) = 0 + 2/n*(i - 1);
end
y = fvalue(x);

syms t; 
%solve for Lagrange multipliers
for i = 1:n + 1
    for k = 1:n + 1
        if i == k;
            l(i) = l(i);
        else
            l(i) = l(i)*(t - x(k))/(x(i) - x(k));
        end
    end
end

%write the approximation function
fappx = sum(y*l);