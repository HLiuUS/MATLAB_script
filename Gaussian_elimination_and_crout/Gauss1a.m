function x = Gauss1a(A,b)

n = size(A,1);  %get the # of rows of A
A = [A,b];      %produces the augmented matrix

%Pivoting
for i = 1:n-1
    for j = i+1:n
        if abs(A(j,i)) > abs(A(i,i))
            U = A(i,:);
            A(i,:) = A(j,:);
            A(j,:) = U;        
        end
    end
end

%Gauss Elimination
for k=1:n-1
    for i=k+1:n
        m = A(i,k)/A(k,k);
        for j=k:n+1
            A(i,j)=A(i,j)-A(k,j)*m;
        end
    end
end

%Backward substitution
x=zeros(n,1);
x(n) = A(n,n+1)/A(n,n);
for i = n - 1:-1:1
    sumax = 0;
    for j = i+1:n
        sumax = sumax + A(i,j)*x(j);
    end
    x(i) = (A(i,n+1) - sumax)/A(i,i);
end