function s = cons_lin_ring3(a,c,a2,b2,c2,a3,b3,x,p,q)
k=(1-q)/p;
if (2^5*c+2^4*a2+2^3*b2+2^2*c2+2*a3+b3)==63 && a==0 
    s=(1/2)*(p+1-q);
elseif (2^5*c+2^4*a2+2^3*b2+2^2*c2+2*a3+b3)==63 && a==1
    s= sum_129ringeps(c,a2,b2,c2,a3,b3,x)-(1/2)*(p+1-q);
elseif (2^5*c+2^4*a2+2^3*b2+2^2*c2+2*a3+b3)~=63 && a==1
    s= sum_129ringeps(c,a2,b2,c2,a3,b3,x);
else
    s= 0;
end
    
end