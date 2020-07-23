function bhat = logreg3MLEpr(X,Y,C,z)
%Returns MLES by maximizing loglike3 with parameter restrictions indicated in
%the cell, C. z indicates what cell contains the parameters to be set to 0.
%Other cells indicates parameters you want set equal. 
d=size(X,2); sc=sum(cellfun(@numel,C));
f=length(C); 
if nargin == 3
Bhatg = ones(1,7*d-sc+f);
options = optimset('TolFun',1e-22,'Display','off');
bhatb=fminunc(@(B)loglike3ps4(X,Y,B,C),Bhatg,options);
D=bhatb(7*d-sc+1:7*d-sc+f); 
bhatb=bhatb(1:7*d-sc);
bhat=insertvalues(bhatb,C,D);
end
if nargin == 4
    f=z-1; 
    Bhatg = ones(1,7*d-sc+f); 
    options = optimset('TolFun',1e-22,'Display','off');
    bhatb=fminunc(@(B)loglike3ps4(X,Y,B,C,z),Bhatg,options);
    D=bhatb(7*d-sc+1:7*d-sc+f);
    D=[D 0];
    bhatb=bhatb(1:7*d-sc);
    bhat=insertvalues(bhatb,C,D);
end
end










