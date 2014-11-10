%BFGS method
%Initialization
x0 = [-4;5];
alpha = 0;
x = x0;
xout = [;];
xout(1,1) = x0(1,1); 
xout(2,1) = x0(2,1);
y = [];     %value of objective function
y(1) = pe(x0);
nmax = 200;    %maximam iteration number
n = 0;      %iteration number
m = 15;     %golden section search number
e = 10^(-10);   %convergence criterion

%Iteration
for q = 1
    h = eye(2);
    df = gradientf(x);
    s = -h*df;
    alphamin = goldensection(x,s);
    x = x + alphamin*s;
    xout(1,q + 1) = x(1,1);
    xout(2,q + 1) = x(2,1);
    y(q + 1) = pe(x);
end
%Iteration

for q = 2:nmax 
    d = dvalue(xout,q,h);
    h = h + d;
    df = gradientf(x);
    s = -h*df;
    alphamin = goldensection(x,s);
    x = x + alphamin*s;
    xout(1,q + 1) = x(1,1);
    xout(2,q + 1) = x(2,1);
    y(q + 1) = pe(x);
    if q >=4 && abs(y(q + 1) - y(q)) <= e && abs(y(q) - y(q - 1)) <= e && ...
            abs(y(q - 1) - y(q - 2)) <= e && abs(y(q - 2) - y(q - 3)) <= e
            n = q + 1;
            break;
    end
end

%Plot the result
plot(0:n - 1,y(1:n),'LineWidth',2);
set(gca,'XTick',1:n-1);
set(gca,'FontSize',20);
xlabel('Number of Iterations','FontSize',24);
ylabel('Value of Objective Function (N/cm^2)','FontSize',24);
grid on