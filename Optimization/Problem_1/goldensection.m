%Golden section method
%Part a: Finding the bounds on the minimum of the function
function alphamin = goldensection(x,s)
a = -0;    %initial interval of alpha
b = 10;
while pe(x + b*s) < pe(x + a*s) %move the interval to approate position
      a = a + 1;
      b = b + 1;
end

%Part b: Reduction of the original interval bound in Part a using the 
%golden section algorithm
r = 0.61803;
m = 15;
c = r*a + (1 - r)*b;
d = (1 - r)*a + r*b;

for k = 1:m
    if pe(x + c*s) <= pe(x + d*s)
       b = d;
       d = c;
       c = r*a + (1 - r)*b;
    else
       a = c;
       c = d;
       d = (1 - r)*a + r*b;
    end
end

%Part c: Cubic polynomial fit to the points obtained at the last 
%iteration of the golden section algorithm
x1 = a;
x2 = c;
x3 = d;
x4 = b;
q1 = x3^3*(x2-x1) - x2^3*(x3-x1) + x1^3*(x3-x2);
q2 = x4^3*(x2-x1) - x2^3*(x4-x1) + x1^3*(x4-x2);
q3 = (x3 - x2)*(x2 - x1)*(x3 - x1);
q4 = (x4 - x2)*(x2 - x1)*(x4 - x1);
q5 = pe(x + x3*s)*(x2-x1) - pe(x + x2*s)*(x3 - x1) + pe(x + x1*s)*(x3 - x2);
q6 = pe(x + x4*s)*(x2-x1) - pe(x + x2*s)*(x4 - x1) + pe(x + x1*s)*(x4 - x2);
a3 = (q3*q6 - q4*q5)/(q2*q3 - q1*q4);
a2 = (q5 - a3*q1)/q3;
a1 = (pe(x + x2*s) - pe(x + x1*s))/(x2 - x1)-a3*(x2^3 - x1^3)/(x2 - x1)-a2*(x1 + x2);
a0 = pe(x + x1*s) - a1*x1 -a2*x1^2 - a3*x1^3;

%Part d: Determining the location of the minimum and the corresponding
%value of the objective function
delta = a2^2 - 3*a1*a3;
x1 = (-a2 + delta^0.5)/(3*a3);
x2 = (-a2 - delta^0.5)/(3*a3);
if delta >0
   alphamin = x1;
elseif delta == 0
   fprintf('x1 and x2 nethier a minimum nor maximum');
else
   fprintf('no real roots');
end