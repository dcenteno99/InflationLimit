function s = cons_lin_2_ring(a,b,c,a2,c2,a3,b3,x)
s=0;
if (2^6*a+2^5*b+2^4*c+2^3*a2+2^2*c2+2*a3+b3)==127 
    s=sum_56789ringeps(a,b,c,a2,x)+sum_123459ringeps(c2,a3,b3,x)-1;
elseif (2^3*a+2^2*b+2*c+a2)==15 && (2^2*c2+2*a3+b3)~=7
    s= sum_123459ringeps(c2,a3,b3,x);
elseif (2^3*a+2^2*b+2*c+a2)~=15 && (2^2*c2+2*a3+b3)==7
    s= sum_56789ringeps(a,b,c,a2,x);
else
    s= 0;
end
    
end