function bhat = logreg3MLE2(X,Y)
%Finds MLE for explantory variables X and responses Y. 
d=size(X,2); 
Bhatg = ones(1,8*d); 
%optimatization - derivative free 
    %bhat=fminsearch(f,Bhatg); 
%optimization with supplied gradient 
options = optimset('GradObj','off','TolFun',1e-22,'Display','off');
    bhat=fminunc(@(B)loglike3_2(X,Y,B),Bhatg,options);
end   