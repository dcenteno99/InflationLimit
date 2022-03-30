function s = sum_234eps(a,b2,c2,x)
s=0;
if a==1 && b2==1 && c2==1 
    for b=[0, 1]
        for c=[0,1]
            for a2=[0,1]
             if b==1 && c==1 && a2==1
             t=a*2^5+b*2^4+c*2^3+a2*2^2+b2*2+c2+1;
             s=s+1-x(t);
             else
             t=a*2^5+b*2^4+c*2^3+a2*2^2+b2*2+c2+1;
             s=s+x(t);
             end
            end
        end
    end
else
for b=[0, 1]
    for c=[0,1]
        for a2=[0,1]
            t=a*2^5+b*2^4+c*2^3+a2*2^2+b2*2+c2+1;
        s=s+ x(t);
        end
    end
end
end
end