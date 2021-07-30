[A,b]= alea(10);
[C,d]= alea(20);
[E,f]= alea(30);
tic  
gaussordinaire(C,d);
h=toc
tic
gaussjordn(C,d);
y=toc
tic
inverse(C,d);
z=toc
tic
gaussseidel(C,d,10^(-2));
w=toc
tic
decmpositionlu(C,d);
t=toc


