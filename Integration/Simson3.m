clear;clc

a = 0;
b = 0.5;
c = 0;
d = 0.5;
h1 = (b - a)/2;
h2 = (d - c)/2;

ga = h2/3*(fvalue3(a,c) + 4*fvalue3(a, (c + d)/2) + fvalue3(a,d));
gab2 = h2/3*(fvalue3((a + b)/2,c) + 4*fvalue3((a + b)/2, (c + d)/2) + fvalue3((a + b)/2,d));
gb = h2/3*(fvalue3(b,c) + 4*fvalue3(b, (c + d)/2) + fvalue3(b,d));
I = h1/3*(ga + 4*gab2 + gb);