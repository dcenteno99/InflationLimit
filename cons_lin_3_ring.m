function s = cons_lin_3_ring(a,b,c,a2,b2,a3,b3,x,p,q)
s=0;
if (2^4*a+2^3*b+2^2*c+2*a2+b2)==31 && (2*a3+b3)==3 
    s=sum_6789ringeps(a,b,c,a2,b2,x)-(1/6)*(p+5*(1-q));
elseif (2^4*a+2^3*b+2^2*c+2*a2+b2)==31 && (2*a3+b3)==0
    s= (1/6)*(5*p+1-q);
elseif (2^4*a+2^3*b+2^2*c+2*a2+b2)==31 && (2*a3+b3)~=3 && (2*a3+b3)~=0
    s= (1/3)*(-p+1-q);
elseif (2^4*a+2^3*b+2^2*c+2*a2+b2)~=31 && (2*a3+b3)==3
    s= sum_6789ringeps(a,b,c,a2,b2,x);
else
    s=0;
end
    
end