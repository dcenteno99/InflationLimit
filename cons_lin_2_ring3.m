function s = cons_lin_2_ring3(a,c,a2,b2,c2,b3,c3,x)
s=0;
if (2^6*a+2^5*c+2^4*a2+2^3*b2+2^2*c2+2*b3+c3)==127 
    s=sum_12789ringeps(c,a2,b2,c2,x)+sum_234567ringeps(a,b3,c3,x)-1;
elseif (2^3*c+2^2*a2+2*b2+c2)==15 && (2^2*a+2*b3+c3)~=7
    s= sum_234567ringeps(a,b3,c3,x);
elseif (2^3*c+2^2*a2+2*b2+c2)~=15 && (2^2*a+2*b3+c3)==7
    s= sum_12789ringeps(c,a2,b2,c2,x);
else
    s= 0;
end
    
end