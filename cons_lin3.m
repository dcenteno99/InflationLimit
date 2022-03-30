function s = cons_lin3(a,c,a2,b2,x,p,q)
k=(1-q)/p;
if (4*c+2*a2+b2)==7 && a==0 
    s=(1/2)*(p+1-q);
elseif (4*c+2*a2+b2)==7 && a==1
    s= sum_126eps(c,a2,b2,x)-(1/2)*(p+1-q);
elseif (4*c+2*a2+b2)~=7 && a==1
    s=sum_126eps(c,a2,b2,x);
else
    s= 0;
end
    
end