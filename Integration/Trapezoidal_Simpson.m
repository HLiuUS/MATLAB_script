clear;clc

%Build two vectors to store values of two method
h = zeros(20,1);
Trap = zeros(20,1);
Simpson = zeros(20,1);

for n = 2:2:40
    h(n/2) = pi/n;
    x = zeros(n + 1,1);
    f = zeros(n + 1,1);
    x(1) = 0;
    f(1) = fvalue(x(1));
    for m = 1:n
        x(m + 1) = m*h(n/2);
        f(m + 1) = fvalue(x(m + 1));
    end
    %Composite Trapezoidal
    Trap(n/2) = h(n/2)/2*(2*sum(f) - f(1) - f(n+1));
    %Composite Simpson's 1/3 rule
    sum1 = 0;
    for m = 2:n
        if rem(m,2) == 0
            sum1 = sum1 + 4*f(m);
        else
            sum1 = sum1 + 2*f(m);
        end
    end
    Simpson(n/2) =  h(n/2)/3*(sum1 + f(1) + f(n+1));
end      

%Calculate the error
Traperror = pi - Trap;
Simpsonerror = pi - Simpson;
    