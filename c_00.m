function s = cons_(a,b,p,q)
if a==0 && b==0
s= (1+5*p-q)/6;
elseif a==0 && b==1 || a==1 && b==0
    s= (1-p-q)/3;
else
    s= (1-p+5*q)/6;
end
    
end