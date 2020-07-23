s=1;
Bbhatdiff=zeros(s,49); 
nBbhatdiff=zeros(1,49); 
n=17350; 
k=6;
for i=1:s
 %simulation1
 B=normrnd(0,.5,[1,(k+1)*7]); 
 mu=normrnd(0,1,[1,k]); sigma=eye(k); 
 X=mvnrnd(mu,sigma,n); X= [ones(n,1) X(:,1:k)]; 
 %simulation2
% load('paper2.mat','B'); 
% X=zeros(n,7); 
% X(:,1)=ones(n,1);
% for j=1:n; if rand<.5935; X(j,2)=1; end; end
% for j=1:n; if rand<0.2809; X(j,3)=1; end; end 
% X(:,4)=normrnd(12.906,2.2391,[n 1]); X(:,5)=X(:,3).*X(:,4); 
% X(:,6)=X(:,2).*X(:,3);X(:,7)=X(:,2).*X(:,4);  
Y=gen_data3(X,B); 
bhat=logreg3MLE(X,Y); 
Bbhatdiff(i,:)=B-bhat;
nBbhatdiff(i)=norm(B-bhat); 
end
meandiffs=mean(Bbhatdiff,1); 
nBhatdiff=mean(nBbhatdiff); 

pardiff = ['The average values of the parameters differences are: ',num2str(meandiffs)];
disp(pardiff)
distnorm = [' The average distance of B to bhat is : ',num2str(nBhatdiff)];
disp(distnorm)
