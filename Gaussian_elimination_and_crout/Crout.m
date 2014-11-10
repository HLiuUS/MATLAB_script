function [L,U] = Crout(A,b)

n = size(A,1);  %get the # of rows of A
L = zeros(n);   %initialize L
U = eye(n);  %initialize U

%LU Decomposition
for j = 1
    for i=1:n
        L(i,1) = A(i,1);
    end
end
    
for i = 1
    for j=2:n
        U(1,j) = A(1,j)/L(1,1);
    end
end

for z = 2:n
    j = z;
    for i = j:n
        sum1 = 0;
        for k = 1:j-1
            sum1 = sum1 + L(i,k)*U(k,j);
        end
        L(i,j) = A(i,j) - sum1;
    end
    i = z;
    if i == n
        break;
    else
        for j = i+1:n
            sum2 = 0;
            for k = 1:i-1
                sum2 = sum2 + L(i,k)*U(k,j);
            end
            U(i,j) = (A(i,j)-sum2)/L(i,i);
        end
    end
end
      
%Forward substitution to solve for xstar
xstar = zeros(n,1);   %initialize xstar
xstar(1) = b(1)/L(1,1);
for i = 2:n
    sum3 = 0;
    for j = 1:i-1
        sum3 = sum3+L(i,j)*xstar(j);
    end
    xstar(i) = (b(i)-sum3)/L(i,i);
end

%Backwart substitution to solve for x
x = zeros(n,1);
x(n) = xstar(n)/U(n,n);
for i=n-1:-1:1
    sum4 = 0;
    for j=i+1:n
        sum4 = sum4+U(i,j)*x(j);
    end
    x(i) = (xstar(i)-sum4)/U(i,i);
end
        
        
