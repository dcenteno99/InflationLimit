function s = cons_lin_4_ring2(b,c,a2,c2,b3,c3,x,p,q)
s=0;
if (2^2*b+2*c+a2)==7 && c2==1 && (2*b3+c3)==3 
    s=sum_156789ringeps(b,c,a2,x)-(1/3)*(2*p+4*(1-q));
elseif (2^2*b+2*c+a2)==7 && c2==1 && (2*b3+c3)==0
    s= (1/6)*(5*p+1-q);
elseif (2^2*b+2*c+a2)==7 && c2==1 && (2*b3+c3)~=3 && (2*b3+c3)~=0
    s= (1/3)*(-p+1-q);
elseif (2^2*b+2*c+a2)==7 && c2==0 && (2*b3+c3)==3
    s=(1/2)*(p+1-q);
elseif (2^2*b+2*c+a2)~=7 && c2==1 && (2*b3+c3)==3
    s= sum_156789ringeps(b,c,a2,x);
else
    s=0;
end