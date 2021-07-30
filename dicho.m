
function[x,n]=dicho(f,a,b,er)
%la méthode de dichotomie 
n=ceil((log((b-a)/er)/log(2))-1);
%ceil-> donne la partie entière
for i=0:n
    x=(a+b)/2;
    if (f(a)*f(b))<0
        b=x;
    else
        if  (f(b)*f(b))<0
            a=x;
        end
    end
end
end
