function F3_prime = F_3prime(a,b,c,a2,b2,c2,p,k)
F3_prime = a2*b*c+a*b2*c2+c*c2*(b*a2+b2*a)*correlator1(p,k);
end