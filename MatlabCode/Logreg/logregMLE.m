function bhat = logregMLE(X,Y)
s=size(X,2); 
Bhatg = ones(s,1); 
options = optimset('TolFun',1e-22,'Display','off');
    bhat=fminunc(@(B)loglike(X,Y,B),Bhatg,options);