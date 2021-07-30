clc
close all
exit=0;
while exit==0
    
    fprintf('---Bienvenue à AnalyseNumApp---\n');
    fprintf('%s\n','1. Calculer une intégrale ','2. Résoudre une équation non linéaire '...
        ,'3. Résoudre un système d’équations linéaires','-1.Quitter');
    c=input('Que voulez vous?');
    q=0;
    while (c~=1)&&(c~=2)&&(c~=3)&&(c~=-1)
        c=input('Que voulez vous?');
    end
    switch c
        case 1
            q=1;
            while q==1
                fprintf('---Bienvenue à AnalyseNumApp (Calcul d''intégrales)---\n');
                %Récupération des données:
                str=input('Veuillez introduire la fonction à integrer > ','s');
                f = inline(str);
                a=input('Veuillez introduire la borne inférieure "a" de votre intervalle > ');
                b=input('Veuillez introduire la borne superieure "b" de votre intervalle > ');
                %Le choix de la méthode:
                fprintf('%s\n','1.La méthode des rectangles', '2.La méthode des trapèzes' ...
                    , '3.La méthode de Simpson');
                m=input('Veuillez choisir une méthode\n');
                while (m~=1)&&(m~=2)&&(m~=3)
                    m=input('Veuillez choisir une méthode\n');
                end
                switch m
                    case 1 %Rectangle
                        n=input('Veuillez introduire le nombre de subdivisions n > ');
                        I=Rec(f,a,b,n);
                        fprintf('L''integrale de votre fonction est:');
                        disp(I);
                    case 2 %Trapèze
                        n=input('Veuillez introduire le nombre de subdivisions n > ');
                        I=Trapezz(f,a,b,n);
                        fprintf('L''integrale de votre fonction est:');
                        disp(I);
                    case 3 %Simpson
                        n=input('Veuillez introduire le nombre de subdivisions n > ');
                        I=Simps(f,a,b,n);
                        fprintf('L''integrale de votre fonction est:');
                        disp(I);
                        
                end
                fprintf('Comment AnalyseNumApp peut encore vous servir ?\n');
                fprintf('%s\n',' 1.Calculer une autre intégrale', ...
                    ' 2.Revenir au menu principale', '-1.Quitter');
                cc=input('Choisissez:\n');
                while (cc~=1)&&(cc~=2)&&(cc~=-1)
                    cc=input('Choisissez:\n');
                end
                
                switch cc
                    case 1
                        exit=1;
                    case 2
                        q=0;
                    case -1
                        exit=1;
                        q=0;
                        fprintf('%s\n','----Vous avez quitter l''application----','Au revoir!');
                end
            end
            
        case 2 %Equation non linéaire
            q=2;
            while q==2
                fprintf('---Bienvenue à AnalyseNumApp (Résoudre une équation non linéaire)---\n');
                str =input("Veuillez introduire la fonction  >","s");
                f=inline(str);
                %Le choix de la méthode
                fprintf('%s\n','1.La méthode de Dichotomie', '2.La méthode Newton Raphson' ...
                    , '3.La méthode du point fixe');
                MRNL=input("Veuillez choisir la méthode de résolution >  ");
                
                while (MRNL~=1)&&(MRNL~=2)&&(MRNL~=3)
                    MRNL=input("Veuillez choisir la méthode de résolution >  ");
                end
                switch MRNL
                    case 1 %Dichotomie
                        a=input("Veuillez introduire la borne inférieur de l''intervalle> ");
                        b=input("Veuillez introduire la borne supérieur de l''intervalle> ");
                        er=input("Veuillez introduire la  précision > ");
                        
                        [x,n]=dico(f,a,b,er);
                        fprintf('La racine est:');
                        disp(x);
                        fprintf('Avec un nombre d''itérations égal à:  ');
                        disp(n);
                    case 2 %Newton-Raphson
                        str =input("donner la  derivee de la fonction =","s");
                        fprim=inline(str);
                        X0=input("Veuillez introduire le premier élement de la suite  > ");
                        er=input ("Veuillez introduire la valeur  de la précision > ");
                        
                        [ X,N ] = Newtenraphson (f ,fprim,X0,er );
                        fprintf('La racine est:');
                        disp(X);
                        fprintf('Avec un nombre d''itérations égal à:  ');
                        disp(N);
                    case 3 %Point fixe
                        er=input ("Veuillez introduire la valeur  de la précision > ");
                        X0=input("Veuillez introduire le premier élement de la suite  > ");
                        [ X,N ] = pointfixe (f ,X0,er );
                        fprintf('La racine est:');
                        disp(X);
                        fprintf('Avec un nombre d''itérations égal à:  ');
                        disp(N);
                end
                fprintf('Comment AnalyseNumApp peut encore vous servir ?\n');
                fprintf('%s\n',' 1.Calculer la racine d''une autre fonction ', ...
                    ' 2.Revenir au menu principale', '-1.Quitter');
                cc=input('Choisissez:\n');
                while (cc~=1)&&(cc~=2)&&(cc~=-1)
                    cc=input('Choisissez:\n');
                end
                
                switch cc
                    case 1
                        exit=1;
                    case 2
                        q=0;
                    case -1
                        exit=1;
                        q=0;
                        fprintf('%s\n','----Vous avez quitter l''application----','Au revoir!');
                end
            end
            
            
        case 3 %système linéaire
            q=3;
            while q==3
                fprintf('---Bienvenue à AnalyseNumApp (Résolution d''un système d’équations linéaires)---\n');
                A=input ("Veuillez introduire votre système sous forme matricielle > ");
                b=input("Veuillez introduire le second membre 'b'  > ");
                fprintf('%s\n',' 1.Gauss ordinaire', ' 2.Gauss-Jordan' ...
                    , ' 3.l’inverse', ' 4.La décomposition LU', ' 5.Gauss Seidel');
                met=input("Veuillez choisir la méthode de résolution >");
                while (met~=1)&&(met~=2)&&(met~=3)
                    met=input("Veuillez choisir la méthode de résolution >  ");
                end
                switch met
                    case 1 %Gauss ordinaire
                        [X]=gaussordinaire(A,b);
                        fprintf('La solution de votre système est:\n');
                        disp(X);
                    case 2 % Gauss-Jordan
                        [X]=gaussjordn(A,b);
                        fprintf('La solution de votre système est:\n');
                        disp(X)
                    case 3 %l’inverse
                        [x]= inverse(A,b);
                        fprintf('La solution de votre système est:\n');
                        disp(x);
                    case 4 %LU
                        [x]=decmpositionlu(A,b);
                        fprintf('La solution de votre système est:\n');
                        disp(x);
                    case 5 %Gauss Seidel
                        eps=input('Veuillez introduire la précision');
                        [x]=gaussseidel(A,b,eps);
                        fprintf('La solution de votre système est:\n');
                        disp(x);
                        
                        
                end
                fprintf('Comment AnalyseNumApp peut encore vous servir ?\n');
                fprintf('%s\n',' 1.Résoudre un autre système', ...
                    ' 2.Revenir au menu principale', '-1.Quitter');
                cc=input('Choisissez:\n');
                while (cc~=1)&&(cc~=2)&&(cc~=-1)
                    cc=input('Choisissez:\n');
                end
                
                switch cc
                    case 1
                        exit=1;
                    case 2
                        q=0;
                    case -1
                        exit=1;
                        q=0;
                        fprintf('%s\n','----Vous avez quitter l''application----','Au revoir!');
                        
                end
            end
            
            
            
            
        case -1
            exit=1;
            fprintf('%s\n','----Vous avez quitter l''application----','Au revoir!');
    end
end