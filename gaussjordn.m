function [X]=gaussjordn(A,b)
n=size (A,1);
for  i=1:n-1
    if A(i,i)==0
        disp (" il n'y a pas de solution suivant cette méthode")
    end
    b(i)=b(i)/A(i,i);
    A(i,:)= A(i,:)/A(i,i);
    for j= i+1:n   
     b(j)=b(j)-b(i)*A(j,i);
A(j,:)= A(j,:)-A(i,:)*A(j,i);
    end 
end 
for  i=n:-1:1
    b(i)=b(i)/A(i,i);
    A(i,:)= A(i,:)/A(i,i);
    for j= i-1:-1:1 
    b(j)=b(j)-b(i)*A(j,i);
A(j,:)= A(j,:)- A(i,:)* A(j,i);
    end
end
X=b;
end

