function s = svalue1(x)
k = gradientf1(x);
s = -k/norm(k);