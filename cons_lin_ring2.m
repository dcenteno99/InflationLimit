function s = cons_lin_ring2(b,c,a2,b2,c2,a3,c3,x,p,q)
k=(1-q)/p;
if (2^5*b+2^4*c+2^3*a2+2^2*b2+2*c2+a3)==63 && c3==0 
    s=(1/2)*(p+1-q);
elseif (2^5*b+2^4*c+2^3*a2+2^2*b2+2*c2+a3)==63 && c3==1
    s= sum_189ringeps(b,c,a2,b2,c2,a3,x)-(1/2)*(p+1-q);
elseif (2^5*b+2^4*c+2^3*a2+2^2*b2+2*c2+a3)~=63 && c3==1
    s= sum_189ringeps(b,c,a2,b2,c2,a3,x);
else
    s= 0;
end
    
end