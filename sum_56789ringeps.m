function s = sum_56789ringeps(a,b,c,a2,x)
s=0;
if a==1 && b==1  && c==1 && a2==1
    for b2=[0, 1]
        for c2=[0,1]
            for a3=[0,1]
                for b3=[0,1]
                    for c3=[0,1]
                        if b2==1 && c2==1 && a3==1 && b3==1 && c3==1
                        t=a*2^8+b*2^7+c*2^6+a2*2^5+b2*2^4+c2*2^3+a3*2^2+b3*2+c3+1;
                        s=s+1-x(t);
                        else
                        t=a*2^8+b*2^7+c*2^6+a2*2^5+b2*2^4+c2*2^3+a3*2^2+b3*2+c3+1;
                        s=s+x(t);
                        end
                    end
                end
             end
            end
    end
else
    for b2=[0,1]
        for c2=[0,1]
            for a3=[0,1]
                    for b3=[0,1]
                        for c3=[0,1]
                            t=a*2^8+b*2^7+c*2^6+a2*2^5+b2*2^4+c2*2^3+a3*2^2+b3*2+c3+1;
                            s=s+ x(t);
                        end
                    end
            end
        end
    end

end
end