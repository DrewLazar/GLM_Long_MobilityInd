%X2=Gender, X3=Race, X4=Age, X5=RacebyAge, X6=RacebyGender, X7=GenderbyAge
%Y1=Mob10, Y2=Mob11, Y3=Mob12 
%Number of observations, n=17350 
n=size(Y,1); 
%Num difficulty in Wave 1, ndY1= 8009, nwdY1= 9341
%Prop difficulty in Wave 1, pdY1= 0.4616, pwdY1= 0.5384
%Num difficulty Wave 2, ndy2 = 8286, nwdY2 = 9064
%Prop difficulty in Wave 2, pdY2= 0.4776, pwdY2= 0.5224
%Num difficulty Wave 3, ndy3 = 9132, nwdY3 = 8218
%Prop difficulty in Wave 3, pdY3= 0.5263, pwdY3= 0.4737
ndY1=sum(Y(:,1)); nwdY1= n-ndY1; pdY1=ndY1/n; pwdY1 = 1 - pdY1; 
ndY2=sum(Y(:,2)); nwdY2 = n - ndY2; pdY2=ndY2/n; pwdY2 = 1 - pdY2; 
ndY3=sum(Y(:,3)); nwdY3 = n - ndY3; pdY3=ndY3/n; pwdY3 = 1 - pdY3; 
%Num with difficulty Wave 2 gdW1, ndy2dy1= 6493, nwdy2gdy1=1516; 
%Prop with difficulty Wave 2 gdW1, pdy2dy1=  0.8107, pwdy2gdy1=0.1893; 
%Num with difficulty Wave 2 gwdW1, ndy2wdy1= 1793, nwdy2gwdy1=7548; 
%Prop with difficulty Wave 2 gwdW1, pdy2wdy1= 0.1919 , pwdy2gdy1= 0.8081;
ndy2dy1=0; for i=1:n; if Y(i,1)==1 && Y(i,2)==1; ndy2dy1=ndy2dy1+1; end; end
nwdy2gdy1=ndY1-ndy2dy1; pdy2dy1=ndy2dy1/ndY1; pwdy2dy1=1-pdy2dy1;
ndy2wdy1=0; for i=1:n; if Y(i,1)==0 && Y(i,2)==1; ndy2wdy1=ndy2wdy1+1; end; end
nwdy2wdy1=nwdY1-ndy2wdy1; pdy2wdy1=ndy2wdy1/nwdY1; pwdy2wdy1=1-pdy2wdy1;
%Conditional dist of y3
ndy3dy2dy1=0; for i=1:n; if Y(i,1)==1 && Y(i,2)==1 && Y(i,3)==1; ndy3dy2dy1=ndy3dy2dy1+1; end; end
nwdy3dy2dy1=0; for i=1:n; if Y(i,1)==1 && Y(i,2)==1 && Y(i,3)==0; nwdy3dy2dy1=nwdy3dy2dy1+1; end; end
ndy3dy2wdy1=0; for i=1:n; if Y(i,1)==0 && Y(i,2)==1 && Y(i,3)==1; ndy3dy2wdy1=ndy3dy2wdy1+1; end; end
nwdy3dy2wdy1=0; for i=1:n; if Y(i,1)==0 && Y(i,2)==1 && Y(i,3)==0; nwdy3dy2wdy1=nwdy3dy2wdy1+1; end; end
ndy3wdy2dy1=0; for i=1:n; if Y(i,1)==1 && Y(i,2)==0 && Y(i,3)==1; ndy3wdy2dy1=ndy3wdy2dy1+1; end; end
nwdy3wdy2dy1=0; for i=1:n; if Y(i,1)==1 && Y(i,2)==0 && Y(i,3)==0; nwdy3wdy2dy1=nwdy3wdy2dy1+1; end; end
ndy3wdy2wdy1=0; for i=1:n; if Y(i,1)==0 && Y(i,2)==0 && Y(i,3)==1; ndy3wdy2wdy1=ndy3wdy2wdy1+1; end; end
nwdy3wdy2wdy1=0; for i=1:n; if Y(i,1)==0 && Y(i,2)==0 && Y(i,3)==0; nwdy3wdy2wdy1=nwdy3wdy2wdy1+1; end; end
%Distribution of explanatory variables 
%Females, nf=10297, pf=59.35%. Males, nm=7053, pm=nm/n;  
nf=sum(X(:,2)); pf=nf/n; nm=n-nf; pm=nm/n; 
%Number of white, nw=12477, pw=71.91% Number of other race, nor=4873, 
%por=28.09 
nor=sum(X(:,3)); por=nor/n; nw=n-nor; pw=nw/n; 
%Mean Age, ma=64.5312, Avg age of females, maf= 65.1420, 
%Avg age of Males, mam=63.6394
ma=mean(exp(X(:,4))); maf=sum(exp(X(:,7)))/10297; mam=(n*ma-nf*maf)/nm; 
%Chi-squared tests for independence,
C12=crosstab(Y(:,1),Y(:,2)); [p12,Q12]=chi2test(C12); 
C23=crosstab(Y(:,2),Y(:,3)); [p23,Q23]=chi2test(C23); 
C13=crosstab(Y(:,1),Y(:,3)); [p13,Q13]=chi2test(C13); 
for i=1:n
if Y(i,1)==0; if Y(i,2)==0; Y12_3(i)=0; else; Y12_3(i)=1; end
else; if Y(i,2)==0; Y12_3(i)=2;else; Y12_3(i)=3;end 
end
end
C12_3=crosstab(Y12_3,Y(:,3));[p12_3,Q12_3]=chi2test(C12_3); 
%Marshall-Olkin correlation coefficient, Y1 and Y2, mo12 = 0.6176
%Marshall-Olkin correlation coefficient, Y2 and Y3, mo23= 0.6233
%Marshall-Olkin correlation coefficient, Y1 and Y3, mo23= 0.5674
mo12=(C12(1,1)*C12(2,2)-C12(1,2)*C12(2,1))/sqrt(sum(C12(1,:))*sum(C12(2,:))*sum(C12(:,1))*sum(C12(:,2)));
mo23=(C23(1,1)*C23(2,2)-C23(1,2)*C23(2,1))/sqrt(sum(C23(1,:))*sum(C23(2,:))*sum(C23(:,1))*sum(C23(:,2)));
mo13=(C13(1,1)*C13(2,2)-C13(1,2)*C13(2,1))/sqrt(sum(C13(1,:))*sum(C13(2,:))*sum(C13(:,1))*sum(C13(:,2)));
%Marshall-Olkin correlation coefficient, Y1 and Y3
%Correlation coefficient Y12_3 and Y3
corrcoef(Y12_3,Y3); 
%Logistic Regression of Y2 on Y1 and X
Y2 = Y(:,2); Y1=Y(:,1); XY1 = [X Y1]; bhat_y2y1 = logregMLE(XY1,Y2); 
bhatR=logregMLE(X,Y2); 
LF=-loglike(XY1,Y2,bhat_y2y1); LR=-loglike(X,Y2,bhatR); RTest=-2*(LR-LF); 
%Logistic Regression of Y3 on Y1, Y2, Y1*Y2 and X 
Y3 = Y(:,3); Y1=Y(:,1); Y2=Y(:,2); Y1Y2=Y1.*Y2; XY2 = [X Y1 Y2 Y1Y2]; bhat_y3y2y1 = logregMLE(XY2,Y3); 
XY3=[X Y1 Y2];bhat_y3y2y1n = logregMLE(XY3,Y3);
LF=-loglike(XY2,Y3,bhat_y3y2y1); LR=-loglike(XY3,Y3,bhat_y3y2y1n); RTest=-2*(LR-LF); 



        

