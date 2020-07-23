function L = loglike3pr(X,Y,B,C,z)
%Returns the negative of loglike3 with parameter restrictions indicated in
%the cell, C. z indicates what cell contains the parameters to be set to 0.
%Other cells indicate parameters you want set equal. 
d=size(X,2); sc=sum(cellfun(@numel,C));
if nargin==4
f=length(C); 
D=B(7*d-sc+1:7*d-sc+f); 
B=B(1:7*d-sc); 
B=insertvalues(B,C,D); 
elseif nargin==5
     f=z-1; 
     D=B(7*d-sc+1:7*d-sc+f);
     D=[D 0];
     B=B(1:7*d-sc); 
     B=insertvalues(B,C,D); 
end
r=length(B); s=r/7; n=length(Y); 
b1=B(1:s); b01=B(s+1:2*s); b11=B(2*s+1:3*s); b001=B(3*s+1:4*s);
b101=B(4*s+1:5*s); b011=B(5*s+1:6*s); b111=B(6*s+1:r); 
sm=zeros(1,n); 
for i=1:n
    x=X(i,:); y1=Y(i,1); y2=Y(i,2); y3=Y(i,3); 
     sm(i)=eta0(x)+y1*eta1(x)+y2*eta2(x)+y1*y2*eta4(x)+y3*eta3(x) ...
     +y1*y3*eta5(x)+y2*y3*eta6(x)+ y1*y2*y3*eta7(x); 
end
L=-sum(sm)/(7*r);
  function a = evals(x,b)
    a=log(1+exp(x*b'));
  end
    function a = eta0(x)
        a=-evals(x,b001)-evals(x,b01)-evals(x,b1);
    end
    function a = eta1(x)
        a=x*b1'+evals(x,b01)+evals(x,b001)-evals(x,b11)-evals(x,b101);
    end
    function a = eta2(x)
        a=x*b01'+evals(x,b001)-evals(x,b011);
    end
    function a = eta3(x)
        a=x*b001';
    end
    function a = eta4(x)
        a=x*(b11-b01)'-evals(x,b001)-evals(x,b111)+evals(x,b011)+evals(x,b101);
    end
    function a = eta5(x)
        a=x*(b101-b001)';
    end
    function a= eta6(x)
        a=x*(b011-b001)';
    end
    function a= eta7(x)
        a=x*(b001+b111-b011-b101)';
    end
 end 

