function F3 = F_3(a,b,c,a2,b2,c2,p,k)
F3 = a*b*c+a2*b2*c2+b*b2*(a*c+a2*c2)*correlator1(p,k);
end