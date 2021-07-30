
function [X]=gaussordinaire(A,b)
n=size (A,1);
 i=1;
 j=i+1;
 for i=1:n
     if A(i,i)==0
        disp (" il n'y a pas de solution suivant cette méthode")
     end
    s=A(i,i);
    for j= i+1:n  
        alpha =A(j,i)/s;
     b(j)=b(j)-alpha*b(i);
A(j,:)= A(j,:)-A(i,:)*alpha;
    end
 end
 X=inv(A)*b;
end
 

    