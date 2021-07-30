function [x]=gaussseidel(A,b,eps)
%eps  C'est la précision 
n= size(A,1);
x0=zeros(n,1);
D=diag(diag(A));
E=-tril(A,-1);          %pour trouver la matrice (E+F) 
F=-triu(A,1);
 x=x0;
 x1=(inv(D-E)*F*x0+inv(D-E)*b);
 while abs(x1-x)>eps
   x=x1;
   x1=inv(D-E)*F *x+inv(D-E)*b;
 end
end

