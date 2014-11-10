clear;clc;

x0 = 0.9;
df = zeros(10,1);
h = zeros(10,1);

for k =1:10
    h(k) = 10^(-k);
    x1 = x0 + h(k);
    f0 = fvalue(x0);
    f1 = fvalue(x1);
    df(k) = (f1 - f0)/h(k);
end

dfexact = cos(exp(0.9) - 2)*exp(0.9);
error = dfexact - df;
loglog(h,abs(error),'LineWidth',2);
xlabel('h');
ylabel('abs(error)');