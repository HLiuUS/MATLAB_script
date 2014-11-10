%initializing
max = 50;           %maxmin iteration numbers
t = 2.4;            %starting point
esp = 1;            %initial espilon
a = 3.2;            %minimum t
b = 3.8;            %maximum t
n = 0;              %to count ineration numbers

%tabulate results
fprintf('  t(n+1)      f(tn+1)       epsilonn        \n');

%iteration
fa=feval(@fvalue,a);
fb=feval(@fvalue,b);
if fa*fb>0
    fprintf('Error: f(a)*f(b) >0');
else
    for k=1:max
        dt=fb/((fb-fa)/(b-a));
        tnew=b-dt;
        fnew=feval(@fvalue,tnew);
        epsilon=min(abs(dt/a),abs(dt/b));
        if epsilon<10^(-8)
            break;
        end
        if fnew==0
            break;
        elseif fnew*fb>0
            b=tnew;
            fb=fnew;
        else
            a=tnew;
            fa=fnew;
        end
        n=n+1;
        fprintf('%12.8f %12.8f %12.8f\n',tnew,fnew,epsilon)
    end
end
        