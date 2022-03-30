function s = cons_lin2(b,c,a2,c2,x,p,q)
k=(1-q)/p;
if (4*b+2*c+a2)==7 && c2==0 
    s=(1/2)*(p+1-q);
elseif (4*b+2*c+a2)==7 && c2==1
    s= sum_156eps(b,c,a2,x)-(1/2)*(p+1-q);
elseif (4*b+2*c+a2)~=7 && c2==1
    s=sum_156eps(b,c,a2,x);
else
    s= 0;
end
    
end