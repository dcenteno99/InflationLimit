function s = sum_14(b,c,b2,c2,x)
s=0;
for a=[0, 1]
    for a2=[0,1]
        t=a*2^5+b*2^4+c*2^3+a2*2^2+b2*2+c2+1;
    s=s+ x(t);
    end
end
end