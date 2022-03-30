function s = cons_lin_2_ring2(b,c,a2,b2,a3,b3,c3,x)
s=0;
if (2^6*b+2^5*c+2^4*a2+2^3*b2+2^2*a3+2*b3+c3)==127 
    s=sum_16789ringeps(b,c,a2,b2,x)+sum_123456ringeps(a3,b3,c3,x)-1;
elseif (2^3*b+2^2*c+2*a2+b2)==15 && (2^2*a3+2*b3+c3)~=7
    s= sum_123456ringeps(a3,b3,c3,x);
elseif (2^3*b+2^2*c+2*a2+b2)~=15 && (2^2*a3+2*b3+c3)==7
    s= sum_16789ringeps(b,c,a2,b2,x);
else
    s= 0;
end
    
end