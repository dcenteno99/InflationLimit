function s = cons_lin_3_ring2(b,c,a2,b2,c2,b3,c3,x,p,q)
s=0;
if (2^4*b+2^3*c+2^2*a2+2*b2+c2)==31 && (2*b3+c3)==3 
    s=sum_1789ringeps(b,c,a2,b2,c2,x)-(1/6)*(p+5*(1-q));
elseif (2^4*b+2^3*c+2^2*a2+2*b2+c2)==31 && (2*b3+c3)==0
    s= (1/6)*(5*p+1-q);
elseif (2^4*b+2^3*c+2^2*a2+2*b2+c2)==31 && (2*b3+c3)~=3 && (2*b3+c3)~=0
    s= (1/3)*(-p+1-q);
elseif (2^4*b+2^3*c+2^2*a2+2*b2+c2)~=31 && (2*b3+c3)==3
    s= sum_1789ringeps(b,c,a2,b2,c2,x);
else
    s=0;
end