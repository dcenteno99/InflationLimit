function s = cons_lin_4_ring3(a,c,a2,b2,a3,c3,x,p,q)
s=0;
if (2^2*c+2*a2+b2)==7 && a3==1 && (2*a+c3)==3 
    s=sum_126789ringeps(c,a2,b2,x)-(1/3)*(2*p+4*(1-q));
elseif (2^2*c+2*a2+b2)==7 && a3==1 && (2*a+c3)==0
    s= (1/6)*(5*p+1-q);
elseif (2^2*c+2*a2+b2)==7 && a3==1 && (2*a+c3)~=3 && (2*a+c3)~=0
    s= (1/3)*(-p+1-q);
elseif (2^2*c+2*a2+b2)==7 && a3==0 && (2*a+c3)==3
    s=(1/2)*(p+1-q);
elseif (2^2*c+2*a2+b2)~=7 && a3==1 && (2*a+c3)==3
    s= sum_126789ringeps(c,a2,b2,x);
else
    s=0;
end