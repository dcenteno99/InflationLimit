function F3_prime2 = F_3prime2(a,b,c,a2,b2,c2,p,k)
F3_prime2 = a2*b2*c+a*b*c2+a*a2*(c*b2+b*c2)*correlator1(p,k);
end