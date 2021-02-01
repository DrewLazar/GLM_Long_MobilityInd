function L = loglike3_2(X,Y,B)
%Returns  the negative of loglike3 (since maximizing). 
r=length(B); s=r/8; n=size(Y,1); 
b1=B(1:s); b2=B(s+1:2*s); b01=B(2*s+1:3*s); b11=B(3*s+1:4*s); b21=B(4*s+1:5*s);...
b02=B(5*s+1:6*s); b12=B(6*s+1:7*s);b22=B(7*s+1:8*s); 
sm=zeros(1,n); 
for i=1:n
    x=X(i,:); z1z2=h(Y(i,1)); z3z4=h(Y(i,2)); z1=z1z2(1); z2=z1z2(2); 
    z3=z3z4(1); z4=z3z4(2); 
     sm(i)=eta0(x)+z1*eta1(x)+z2*eta2(x)+z3*eta3(x)+z4*eta4(x)+z1*z3*eta5(x)...
     +z1*z4*eta6(x)+z2*z3*eta7(x)+z2*z4*eta8(x); 
end
L=-sum(sm)/56;
%if nargout > 1 % gradient required
%   grads = -grad_lrMLE3(X,Y,B);
%end
    function a = evals(x,b,c)
         a=log(1+exp(x*b')+exp(x*c'));
    end
    function a = eta0(x)
         a=evals(x,b02,b01)+evals(x,b1,b2);
    end
    function a = eta1(x)
        a=x*b1'+evals(x,b02,b01)-evals(x,b11,b12);
    end
    function a = eta2(x)
        a=b2*x'-evals(x,b21,b22)+evals(x,b02,b01); 
    end
    function a = eta3(x) 
        a=b01*x';
    end
    function a = eta4(x)
        a=b02*x';
    end
    function a = eta5(x)
        a=(b11-b01)*x';
    end
    function a = eta6(x)
        a=(b12-b02)*x';
    end
    function a = eta7(x)
        a=(b21-b01)*x';
    end
    function a = eta8(x)
        a=(b22-b2)*x' + evals(x,b21,b22) - evals(x,b02,b01);
    end
    function  z=h(yp)
        if yp==0, z=[0 0]; elseif yp==1, z=[1 0]; else, z=[0 1]; 
        end
    end

 end 

