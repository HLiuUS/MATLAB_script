function k = gradientf(x)
k = [(8*x(1)*(((x(2) - 10)^2 + x(1)^2)^(1/2) - 10))/((x(2) - 10)^2 + ...
    x(1)^2)^(1/2)+ (x(1)*(((x(2) + 10)^2 + x(1)^2)^(1/2) - 10))/((x(2) ...
    + 10)^2 + x(1)^2)^(1/2) - 5;(4*(((x(2) - 10)^2 + x(1)^2)^(1/2) - ...
    10)*(2*x(2) - 20))/((x(2) - 10)^2 + x(1)^2)^(1/2) + ((((x(2) + ...
    10)^2 + x(1)^2)^(1/2) - 10)*(2*x(2) + 20))/(2*((x(2) + 10)^2 + ...
    x(1)^2)^(1/2)) - 5];