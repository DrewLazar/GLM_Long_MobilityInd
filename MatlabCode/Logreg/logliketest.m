B = [0.43;-1.7;2.8]; 
n=1000; 
X = [ones(n,1) randn(n,1) randn(n,1)];
s=size(X,2); 
XB=X*B; 
Y=zeros(n,1);
for i=1:n
    p = exp(XB(i))/(1+exp(XB(i)));
    if rand < p; Y(i)=1; end
end
bhat=logregMLE(X,Y);