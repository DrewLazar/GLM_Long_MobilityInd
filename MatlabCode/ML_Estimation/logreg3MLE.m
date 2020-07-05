function bhat = logreg3MLE(X,Y)
%Finds MLE for explantory variables X and responses Y. 
d=size(X,2); 
Bhatg = ones(1,7*d); 
%optimatization - derivative free 
    %bhat=fminsearch(f,Bhatg); 
%optimization with supplied gradient 
options = optimset('GradObj','on','TolFun',1e-22,'Display','off');
    bhat=fminunc(@(B)loglike3(X,Y,B),Bhatg,options);
end