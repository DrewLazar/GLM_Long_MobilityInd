%Partition data into random training and validation, build model on 
%training and predict on validation.  
n=length(mobilitydata_agedb5);
prop=0.90; 
samplesize=round(prop*n); 
valsize=n-samplesize; 
Indices=randperm(n);
training_mobdata=mobilitydata_agedb5(Indices(1:samplesize),:); 
validation_mobdata=mobilitydata_agedb5(Indices(samplesize+1:n),:); 
X_tr=training_mobdata(:,1:6);
X_tr=[ones(samplesize,1) X_tr]; 
Y_tr=validation_mobdata(:,7:9); 
bhat_tr=logreg3MLE(X_tr,Y_tr); 
X_val=validation_mobdata(:,1:6);
X_val=[ones(valsize,1) X_val]; 
Y_val=validation_mobdata(:,7:9);
pred=zeros(valsize,3); 
for i=1:valsize
    pred(i,:)=prediction(X_val(i,:),bhat_tr);
end
agmt=zeros(valsize,1); 
for i=1:valsize
    agmt(i)=isequal(pred(i,:),Y(i,:));
end
