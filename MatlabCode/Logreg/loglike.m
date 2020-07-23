function L = loglike(X,Y,B)
%Computes the loglikehood of logistic regression with covariates, 
%X, response Y and parameters B 
XB = X*B;
YXB = Y.*XB;
EXB = exp(XB); 
L=-sum(log(1./(1+EXB))+YXB); 
end

