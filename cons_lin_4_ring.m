function s = cons_lin_4_ring(a,b,c,b2,a3,b3,x,p,q)
s=0;
if (2^2*a+2*b+c)==7 && b2==1 && (2*a3+b3)==3 
    s=sum_456789ringeps(a,b,c,x)-(1/3)*(2*p+4*(1-q));
elseif (2^2*a+2*b+c)==7 && b2==1 && (2*a3+b3)==0
    s= (1/6)*(5*p+1-q);
elseif (2^2*a+2*b+c)==7 && b2==1 && (2*a3+b3)~=3 && (2*a3+b3)~=0
    s= (1/3)*(-p+1-q);
elseif (2^2*a+2*b+c)==7 && b2==0 && (2*a3+b3)==3
    s=(1/2)*(p+1-q);
elseif (2^2*a+2*b+c)~=7 && b2==1 && (2*a3+b3)==3
    s= sum_456789ringeps(a,b,c,x);
else
    s=0;
end