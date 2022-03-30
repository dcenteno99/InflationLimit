
p=0.001;
q=0.99;

for a=[0,1]
    for b=[0,1]
        for c=[0,1]
            for d=[0,1]
                x=cons(a,b,p,q)*cons(c,d,p,q);
                y=cons_square(a,b,c,d,p,q);
                z=cons_square_lin(a,b,c,d,p,q);
                if z~=y
                    z
                    y
                    disp(["something wrong with ", num2str(a), num2str(b), num2str(c), num2str(d)])
                else
                    disp("cool")
                end
            end
        end
    end
end