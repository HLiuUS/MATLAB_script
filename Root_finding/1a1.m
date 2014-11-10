%initializing
max = 50;           %maxmin iteration numbers
t = 2.2;            %starting point
esp = 1;            %initial espilon
n=0;                %to count ineration numbers

%tabulate results
fprintf('  tn          f(tn)         deltant      t(n+1)      \n');

%iteration
while (esp>10^(-8)) && (n<50)
    ftn = 2*sin(t^2)-3*t*sin(t^2)+t^2*sin(t^2);
    deltant = (2*sin(t^2)-3*t*sin(t^2)+t^2*sin(t^2))/(4*t*cos(t^2)-3*sin(t^2)+2*t*sin(t^2)-6*t^2*cos(t^2)+2*t^3*cos(t^2));
    tnew = t-deltant;
    esp = abs(tnew-t)/abs(t);
    n = n+1;
    fprintf('%12.8f %12.8f %12.8f %12.8f\n',t,ftn,deltant,tnew)
    t = tnew;
end