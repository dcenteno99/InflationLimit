function s = cons_lin5(b,a2,b2,c2,x,p,q)
k=(1-q)/p;
if (4*a2+2*b2+c2)==7 && b==0 
    s=(1/2)*(p+1-q);
elseif (4*a2+2*b2+c2)==7 && b==1
    s= sum_123eps(a2,b2,c2,x)-(1/2)*(p+1-q);
elseif (4*a2+2*b2+c2)~=7 && b==1
    s=sum_123eps(a2,b2,c2,x);
else
    s= 0;
end
    
end