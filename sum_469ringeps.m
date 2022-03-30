function s = sum_469ringeps(a,b,c,b2,a3,b3,x)
s=0;
if a==1 && b==1 && c==1 && b2==1 && a3==1 && b3==1
    for a2=[0, 1]
        for c2=[0,1]
            for c3=[0,1]
             if a2==1 && c2==1 && c3==1
             t=a*2^8+b*2^7+c*2^6+a2*2^5+b2*2^4+c2*2^3+a3*2^2+b3*2+c3+1;
             s=s+1-x(t);
             else
             t=a*2^8+b*2^7+c*2^6+a2*2^5+b2*2^4+c2*2^3+a3*2^2+b3*2+c3+1;
             s=s+x(t);
             end
            end
        end
    end
else
for a2=[0, 1]
    for c2=[0,1]
        for c3=[0,1]
            t=a*2^8+b*2^7+c*2^6+a2*2^5+b2*2^4+c2*2^3+a3*2^2+b3*2+c3+1;
            s=s+ x(t);
        end
    end
end
end
end