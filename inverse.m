 function [x]= inverse(A,b)
[n,m]=size(A);
if n~= m
    disp("la matrice n'est pas carrée")
else
    if det(A)==0
        disp (" A n'est pas inversible ")
    end 
end
% Ax=b  à résoudre 
x=inv(A)*b;

end

