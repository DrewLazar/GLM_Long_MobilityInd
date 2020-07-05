function Y = gen_data3(X,B)
%Generate data with covariates X and parameters B according to the 
%distribution assumed in (5.2) using a Monte Carlo Simulation. 
n=size(X,1); 
r=length(B); s=r/7; 
b1=B(1:s); b01=B(s+1:2*s); b11=B(2*s+1:3*s); b001=B(3*s+1:4*s);
b101=B(4*s+1:5*s); b011=B(5*s+1:6*s); b111=B(6*s+1:r); 
Y=zeros(n,3); 
for i=1:n
    x=X(i,:); 
    p000=jointy1y2y3(0,0,0,x);
    p010=jointy1y2y3(0,1,0,x);
    p100=jointy1y2y3(1,0,0,x);
    p001=jointy1y2y3(0,0,1,x);
    p110=jointy1y2y3(1,1,0,x);
    p011=jointy1y2y3(0,1,1,x);
    p101=jointy1y2y3(1,0,1,x);
    ur=rand;
    if ur<p000; Y(i,1)=0; Y(i,2)=0; Y(i,3)=0;
    elseif p000<=ur&&ur<p000+p010; Y(i,1)=0; Y(i,2)=1; Y(i,3)=0;
    elseif p000+p010<=ur&&ur<p000+p010+p100; Y(i,1)=1; Y(i,2)=0; Y(i,3)=0;
    elseif p000+p010+p100<=ur&&ur<p000+p010+p100+p001; Y(i,1)=0; Y(i,2)=0; Y(i,3)=1;
    elseif p000+p010+p100+p001<=ur&&ur<p000+p010+p100+p001+p110; Y(i,1)=1; Y(i,2)=1; Y(i,3)=0;
    elseif p000+p010+p100+p001+p110<=ur&&ur<p000+p010+p100+p001+p110+p011; Y(i,1)=0; Y(i,2)=1; Y(i,3)=1;
    elseif p000+p010+p100+p001+p110+p011<=ur&&ur<p000+p010+p100+p001+p110+p011+p101; Y(i,1)=1; Y(i,2)=0; Y(i,3)=1;
    else;   Y(i,1)=1; Y(i,2)=1; Y(i,3)=1;
    end
end
 function a = IL(x,b)
    a=exp(x*b')/(1+exp(x*b'));
  end
function a =pdfy1(y1,x)
  if y1==1; a=IL(x,b1);
  else; a=1-IL(x,b1);
  end
end
function a=pdfy2gy1(y2,y1,x)
  if y1==1; if y2==1; a=IL(b11,x); else; a=1-IL(b11,x); end
  else; if y2==1; a=IL(b01,x); else; a=1-IL(b01,x); end
  end
end
    function a=pdfy3gy1y2(y3,y2,y1,x)
        if y1==0 && y2==0; if y3==1; a=IL(b001,x); else; a=1-IL(b001,x); end
            elseif y1==1 && y2==0; if y3==1; a=IL(b101,x); else; a=1-IL(b101,x); end
            elseif y1==0 && y2==1; if y3==1; a=IL(b011,x); else; a=1-IL(b011,x); end
                else; if y3==1; a=IL(b111,x); else; a=1-IL(b111,x); end
        end
    end
function a = jointy1y2y3(y1,y2,y3,x)
a=pdfy1(y1,x)*pdfy2gy1(y2,y1,x)*pdfy3gy1y2(y3,y2,y1,x);
end
end