%initializing
max = 100;          %maxmin iteration numbers
t = 500;            %starting point
esp = 1;            %initial espilon
n=0;                %to count ineration numbers

%tabulate results
fprintf('  T(n)          T(n+1)          espilon        \n');

%iteration
while (esp>10^(-5)) && (n<max)
    tnew = ((1.671*10^(-4)*t+9.7215*10^(-8)*t^2-9.5838*10^(-11)*t^3-0.20597)/(-1.952*10^(-14)))^(1/4);
    esp = abs(tnew-t)/abs(t);
    n = n+1;
    fprintf('  %12.8f %12.8f %12.8f\n',t,tnew,esp)
    t = tnew;
end