function gradiMLE3 = gradi_lrMLE3(X,Y,B,k)
%Returns partial derivatives with respect to parameter k for use in
%estimation of the Fisher information evaluated at parameter k 
r=length(B); s=r/7;  
b1=B(1:s); b01=B(s+1:2*s); b11=B(2*s+1:3*s); b001=B(3*s+1:4*s);
b101=B(4*s+1:5*s); b011=B(5*s+1:6*s); b111=B(6*s+1:r);  
    x=X(k,:); y1=Y(k,1); y2=Y(k,2); y3=Y(k,3); 
gradiMLE3=(geta0(x)+y1*geta1(x)+y2*geta2(x)+y1*y2*geta4(x)+y3*geta3(x) ...
     +y1*y3*geta5(x)+y2*y3*geta6(x)+ y1*y2*y3*geta7(x))/(7*r^2); 
 function a = IL(x,b)
    a=exp(x*b')*x/(1+exp(x*b'));
  end
    function a = geta0(x)
        a=-[IL(x,b1) IL(x,b01) zeros(1,s) IL(x,b001) zeros(1,s) zeros(1,s) zeros(1,s)]; 
    end
    function a = geta1(x)
        a=[x IL(x,b01) -IL(x,b11) IL(x,b001) -IL(x,b101) zeros(1,s) zeros(1,s)];
    end
    function a = geta2(x)
        a=[zeros(1,s) x zeros(1,s) IL(x,b001) zeros(1,s) -IL(x,b011) zeros(1,s)] ;
    end
    function a = geta3(x)
        a=[zeros(1,s) zeros(1,s) zeros(1,s) x zeros(1,s) zeros(1,s) zeros(1,s)];
    end
    function a = geta4(x)
        a=[zeros(1,s) -x x -IL(x,b001) IL(x,b101) IL(x,b011) -IL(x,b111)];
    end
    function a = geta5(x)
        a=[zeros(1,s) zeros(1,s) zeros(1,s) -x x zeros(1,s) zeros(1,s)];
    end
    function a= geta6(x)
        a=[zeros(1,s) zeros(1,s) zeros(1,s) -x zeros(1,s) x zeros(1,s)];
    end
    function a= geta7(x)
        a=[zeros(1,s) zeros(1,s) zeros(1,s) x -x -x x];
    end
 end 

