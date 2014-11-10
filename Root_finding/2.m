%initializing
max = 100;          %maxmin iteration numbers
alphaold = 2;       %starting point 1
alphanew = 1.9;     %starting point 2
esp = 1;            %initial espilon
n=0;                %to count ineration numbers

%tabulate results
fprintf('    Alpha(n)      f(alphan)       deltanalpha    aplha(n+1)      \n');

%iteration
while (esp>10^(-6)) && (n<50)
    falphan = feval(@falpha,alphanew);
    falphan1 = feval(@falpha,alphaold);
    deltanalpha = falphan*(alphanew-alphaold)/(falphan-falphan1);
    alphanew1 = alphanew-deltanalpha;
    esp = abs(alphanew1-alphanew)/abs(alphanew);
    n = n+1;
    fprintf('%14.8f %14.8f %14.8f %14.8f\n',alphanew,falphan,deltanalpha,alphanew1)
    alphaold = alphanew;
    alphanew = alphanew1;
end