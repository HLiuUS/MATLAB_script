function d = dvalue(x,k,h)
p = x(:,k) - x(:,k - 1);
y = gradientf(x(:,k)) - gradientf(x(:,k - 1));
delta = p'*y;
tao = y'*h*y;
d = (delta + tao)/delta^2*(p)*(p') - 1/delta*(h*y*p' + p*(h*y)');