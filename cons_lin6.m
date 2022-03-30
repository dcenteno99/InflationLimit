function s = cons_lin6(a,c,b2,c2,x,p,q)
k=(1-q)/p;
if (4*a+2*b2+c2)==7 && c==0 
    s=(1/2)*(p+1-q);
elseif (4*a+2*b2+c2)==7 && c==1
    s= sum_234eps(a,b2,c2,x)-(1/2)*(p+1-q);
elseif (4*a+2*b2+c2)~=7 && c==1
    s=sum_234eps(a,b2,c2,x);
else
    s= 0;
end
    
end