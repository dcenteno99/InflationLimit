%F = sdpvar(10,1);
A = zeros(64,10); %Matrix with coefficients of the constraints
blc = zeros(64,1); %lower bound for the constraints
precision=10;
ind_p = 1;%index for each value of p
ind_q = 1;%index for each value of q
for p=linspace(0.001,1,precision)
    ind_q=1;
    for q=linspace(0.001,(1-p),precision)
        k=(1-q)/p;
        F = sdpvar(10,1);
        for a = [-1 1]
            for b = [-1 1]
                for c = [-1 1]
                    for a2 = [-1 1]
                        for b2 = [-1 1]
                            for c2 = [-1 1]
                                 j=2^5*((a+1)/2)+ 2^4*((b+1)/2)+ 2^3*((c+1)/2)+ 2^2*((a2+1)/2)+2^1*((b2+1)/2)+2^0*((c2+1)/2)+1;
                                 A(j,1)=F_3(a,b,c,a2,b2,c2,p,k);
                                 A(j,2)=F_3prime(a,b,c,a2,b2,c2,p,k);
                                 A(j,3)=F_3prime2(a,b,c,a2,b2,c2,p,k);
                                 A(j,4)=F_4(a,b,c,a2,b2,c2,p,k);
                                 A(j,5)=F_4prime(a,b,c,a2,b2,c2,p,k);
                                 A(j,6)=F_4prime2(a,b,c,a2,b2,c2,p,k);
                                 A(j,7)=F_5(a,b,c,a2,b2,c2,p,k);
                                 A(j,8)=F_5prime(a,b,c,a2,b2,c2,p,k);
                                 A(j,9)=F_5prime2(a,b,c,a2,b2,c2,p,k);
                                 A(j,10)=F_6(a,b,c,a2,b2,c2,p,k);
                                 blc(j,1)=coef(a,b,c,a2,b2,c2,p,k);
                            end
                        end
                    end
                end
            end
        end
        constraints = [A*F >= blc, -1 <= F,F <= 1];
        options = sdpsettings('solver','mosek');
        %optimize(constraints,[],options);
        diagnostics = optimize(constraints,[],options);
        solution = value(F);
         M(ind_p,ind_q)=diagnostics.problem;
         M_q(ind_p,ind_q)=q;
         M_p(ind_p,ind_q)=p;
         ind_q=ind_q+1;
        end
    ind_p=ind_p+1;
end

surface(M_p,M_q,M)




%m=A*solution-blc %checking the solution. It is right if m>=0