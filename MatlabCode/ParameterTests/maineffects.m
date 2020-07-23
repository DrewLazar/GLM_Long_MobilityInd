Z=1:49;
for k=0:6
    Z(1+6*k)=[];
end
C{1}=Z; 
bhatme=logreg3MLEpr(X,Y,C,1); 
    