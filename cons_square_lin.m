function s = cons_square_lin(a,b,a2,b2,p,q)
k=(1-q)/p;
if a==1 && b==1 && a2==0 && b2==0 || a==0 && b==0 && a2==1 && b2==1
s= (5*p+1-q)/6;
elseif a==1 && b==1 && a2==1 && b2==1
    s= 1-(p+5*(1-q))/18;
elseif a==1 && b==1 && a2==0 && b2==1 || a==1 && b==1 && a2==1 && b2==0 || a==0 && b==1 && a2==1 && b2==1 || a==1 && b==0 && a2==1 && b2==1
s=(-p+(1-q))/3;
else
    s= 0;
end
    
end