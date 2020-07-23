function [BIC,AIC] = LGOF(X,Y,B,p)
%Return BIC and AIC. p is the number of parameters estimated. 
n=size(X,1); 
AIC=2*loglike3(X,Y,B)+2*p;
BIC=2*loglike3(X,Y,B)+p*log(n);
end
