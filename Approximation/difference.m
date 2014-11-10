clear;clc;

x0 = 0.9;
df = zeros(1,10);
h = zeros(1,10);

for k =1:10
    h(k) = 10^(-k);
    x2p = x0 + 2*h(k);
    x1p = x0 + h(k);
    x1m = x0 - h(k);
    x2m = x0 - 2*h(k);
    f2p = fvalue(x2p);
    f1p = fvalue(x1p);
    f1m = fvalue(x1m);
    f2m = fvalue(x2m);
    df(k) = 1/12/h(k)*(-f2p + 8*f1p - 8*f1m + f2m);
end

dfexact = cos(exp(0.9) - 2)*exp(0.9);
error = dfexact - df;
loglog(h,abs(error),'LineWidth',2);
xlabel('h');
ylabel('abs(error)');