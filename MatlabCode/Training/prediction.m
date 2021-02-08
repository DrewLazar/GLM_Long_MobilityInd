%Prediction of observation class based on greatest log-likelihood. 
function pred = prediction(X,B)
M(1,:)=[1,0,0]; 
M(2,:)=[1,1,0];
M(3,:)=[1,0,1];
M(4,:)=[1,1,1];
M(5,:)=[0,0,0]; 
M(6,:)=[0,1,0];
M(7,:)=[0,0,1];
M(8,:)=[0,1,1];
a=zeros(8,1); 
for i=1:8
    a(i)=loglike3(X,M(i,:),B); 
end
b=find(a == min(a(:))); 
pred=M(b,:); 
      