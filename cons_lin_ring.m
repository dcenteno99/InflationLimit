function s = cons_lin_ring(a,b,c,a2,b2,c2,b3,x,p,q)
k=(1-q)/p;
if (2^5*a+2^4*b+2^3*c+2^2*a2+2*b2+c2)==63 && b3==0 
    s=(1/2)*(p+1-q);
elseif (2^5*a+2^4*b+2^3*c+2^2*a2+2*b2+c2)==63 && b3==1
    s= sum_789ringeps(a,b,c,a2,b2,c2,x)-(1/2)*(p+1-q);
elseif (2^5*a+2^4*b+2^3*c+2^2*a2+2*b2+c2)~=63 && b3==1
    s=sum_789ringeps(a,b,c,a2,b2,c2,x);
else
    s= 0;
end
    
end