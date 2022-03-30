function s = cons_lin(a,b,c,b2,x,p,q)
k=(1-q)/p;
if (4*a+2*b+c)==7 && b2==0 
    s=(1/2)*(p+1-q);
elseif (4*a+2*b+c)==7 && b2==1
    s= sum_456eps(a,b,c,x)-(1/2)*(p+1-q);
elseif (4*a+2*b+c)~=7 && b2==1
    s=sum_456eps(a,b,c,x);
else
    s= 0;
end
    
end