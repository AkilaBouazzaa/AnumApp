function[x]=decmpositionlu(A,b)
        n=size (A,1);
 L =eye(n);
 i=1;
 j=i+1;
 for i=1:n
    

    s=A(i,i);
    for j= i+1:n  
        alpha =A(j,i)/s;
        L(j,i)=alpha;
     b(j)=b(j)-alpha*b(i);
A(j,:)= A(j,:)-(alpha*A(i,:));
    end
 end
 U=A;
 U=round(U,1);
 L;
 U;
 w=L*U;
 y=inv(L)*b;
 x=inv(U)*y;
end

