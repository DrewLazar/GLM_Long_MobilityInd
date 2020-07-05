n=15000; 
k=6;
B=normrnd(0,1,[1,(k+1)*7]); 
mu=normrnd(0,1,[1,k]); sigma=eye(k); 
X=mvnrnd(mu,sigma,n); X= [ones(n,1) X(:,1:k)]; 
Y=gen_data3(X,B); 
bhat = logreg3MLE(X,Y); 
poppar = [' The values of the pop parameters are: ',num2str(B)];
disp(poppar)
parest = [' The values of their estimates are: ',num2str(bhat)];
disp(parest)
