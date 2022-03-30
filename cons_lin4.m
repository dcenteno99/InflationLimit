function s = cons_lin4(a,b,a2,c2,x,p,q)
k=(1-q)/p;
if (4*a+2*b+c2)==7 && a2==0 
    s=(1/2)*(p+1-q);
elseif (4*a+2*b+c2)==7 && a2==1
    s= sum_345eps(a,b,c2,x)-(1/2)*(p+1-q);
elseif (4*a+2*b+c2)~=7 && a2==1
    s=sum_345eps(a,b,c2,x);
else
    s= 0;
end
    
end