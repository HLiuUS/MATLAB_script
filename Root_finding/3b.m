%initializing
max = 100;            %maxmin iteration numbers
t = -1;               %starting point
esp = 1;              %initial espilon
n=0;                  %to count ineration numbers
semilog1=[];          %matrix to store |f(xn)/f(x0)|

%tabulate results
fprintf('  x(n)        f(xn)        deltanx      x(n+1)      \n');

%iteration
while (esp>10^(-5)) && (n<max)
    ftn = feval(@fvalue32,t);
    ftn1 = feval(@fvalue33,t);
    deltant = ftn/ftn1;
    tnew = t-deltant;
    esp = abs(tnew-t)/abs(t);
    fprintf('%12.8f %12.8f %12.8f %12.8f\n',t,ftn,deltant,tnew);
    n = n+1;
    t = tnew;
    semilog1(n)=log(abs(feval(@fvalue3,t)/feval(@fvalue3,-1)));
end

plot(1:n,semilog1,'-*');