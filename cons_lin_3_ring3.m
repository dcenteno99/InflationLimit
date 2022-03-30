function s = cons_lin_3_ring3(a,c,a2,b2,c2,a3,c3,x,p,q)
s=0;
if (2^4*c+2^3*a2+2^2*b2+2*c2+a3)==31 && (2*a+c3)==3 
    s=sum_1289ringeps(c,a2,b2,c2,a3,x)-(1/6)*(p+5*(1-q));
elseif (2^4*c+2^3*a2+2^2*b2+2*c2+a3)==31 && (2*a+c3)==0
    s= (1/6)*(5*p+1-q);
elseif (2^4*c+2^3*a2+2^2*b2+2*c2+a3)==31 && (2*a+c3)~=3 && (2*a+c3)~=0
    s= (1/3)*(-p+1-q);
elseif (2^4*c+2^3*a2+2^2*b2+2*c2+a3)~=31 && (2*a+c3)==3
    s= sum_1289ringeps(c,a2,b2,c2,a3,x);
else
    s=0;
end