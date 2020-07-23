function  Bins=insertvalues(x,C,D)
%Function used to insert values in a vector. Used for parameter 
%restriction. C contains cells with vectors which indiate where you want 
%values placed and D is vector that contains the values. 
s=size(C,2);
v=C{1}; 
a=size(C{1},2);  
v1=D(1)*ones(1,a); 
for k=1:s-1
    v=[v C{k+1}]; 
    a=size(C{k+1},2); 
    v1=[v1 D(k+1)*ones(1,a)]; 
end
v2=[v; v1];
v2=sortrows(v2',1)';
b=size(v2,2);
n=v2(1,1)-1; 
vi=v2(2,1); 
  Bins=cat(2,x(1:n), vi, x(n+1:end));
for k=2:b 
n=v2(1,k)-1; 
vi=v2(2,k); 
  Bins=cat(2,Bins(1:n), vi, Bins(n+1:end));
end
end