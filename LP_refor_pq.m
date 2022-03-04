%x = sdpvar(64,1);%variables
precision=100;
klimit=1000;
ind_p = 1;%index for each value of p
ind_q = 1;%index for each value of q
for p=linspace(0.001,1,precision)
    ind_q=1;
    for q=linspace(0.001,(1-p),precision)
        x = sdpvar(64,1);
 constraints= [sum(x)==1, x>=0];
 %first we add constraints of the type Q(abcab')=Q(abc)P(b'), we have 6
 %like this
        for a = [0 1]
            for b = [0 1]
                for c = [0 1]
                        for b2 = [0 1]
                             constraints= [constraints, sum_46(a,b,c,b2,x)==sum_456(a,b,c,x)*cons1(b2,p,q)];
                        end
                end
            end
        end
        
  for b = [0 1]
            for c = [0 1]
                for a2 = [0 1]
                        for c2 = [0 1]
                             constraints= [constraints, sum_15(b,c,a2,c2,x)==sum_156(b,c,a2,x)*cons1(c2,p,q)];
                        end
                end
            end
  end  
        
  for a = [0 1]
            for c = [0 1]
                for a2 = [0 1]
                        for b2 = [0 1]
                             constraints= [constraints, sum_26(a,c,a2,b2,x)==sum_126(c,a2,b2,x)*cons1(a,p,q)];
                        end
                end
            end
  end 
        
for a = [0 1]
            for b = [0 1]
                for a2 = [0 1]
                        for c2 = [0 1]
                             constraints= [constraints, sum_35(a,b,a2,c2,x)==sum_345(a,b,c2,x)*cons1(a2,p,q)];
                        end
                end
            end
  end 
               
   for b = [0 1]
            for a2 = [0 1]
                for b2 = [0 1]
                        for c2 = [0 1]
                             constraints= [constraints, sum_13(b,a2,b2,c2,x)==sum_123(a2,b2,c2,x)*cons1(b,p,q)];
                        end
                end
            end
  end      
        
  for a = [0 1]
            for c = [0 1]
                for b2 = [0 1]
                        for c2 = [0 1]
                             constraints= [constraints, sum_24(a,c,b2,c2,x)==sum_234(a,b2,c2,x)*cons1(c,p,q)];
                        end
                end
            end
  end        
%Now we add constraints of the type Q(ab)=P(ab)        
for a=[0,1]
    for b=[0,1]
         constraints = [constraints, sum_3456(a,b,x) == cons(a,b,p,q)];
    end
end

for a=[0,1]
    for c2=[0,1]
         constraints = [constraints, sum_2345(a,c2,x) == cons(a,c2,p,q)];
    end
end

for b2=[0,1]
    for c2=[0,1]
         constraints = [constraints, sum_1234(b2,c2,x) == cons(b2,c2,p,q)];
    end
end

for a2=[0,1]
    for b2=[0,1]
         constraints = [constraints, sum_1236(a2,b2,x) == cons(a2,b2,p,q)];
    end
end

for c=[0,1]
    for a2=[0,1]
         constraints = [constraints, sum_1256(c,a2,x) == cons(c,a2,p,q)];
    end
end

for b=[0,1]
    for c=[0,1]
         constraints = [constraints, sum_1456(b,c,x) == cons(b,c,p,q)];
    end
end

%We add now the constraints Q(abca'b'c')=Q(a'b'c'abc)
for a = [0 1]
            for b = [0 1]
                for c = [0 1]
                    for a2=[0,1]
                        for b2 = [0 1]
                            for c2=[0,1]
                                t=a*2^5+b*2^4+c*2^3+a2*2^2+b2*2+c2+1;
                                t2=a2*2^5+b2*2^4+c2*2^3+a*2^2+b*2+c+1;
                                constraints=[constraints, x(t)==x(t2)];
                            end
                        end
                    end
                end
            end
end

%Finally we add the constraints of the type Q(aba'b')=P(ab)P(a'b')
for a = [0 1]
            for b = [0 1]
                 for a2=[0,1]
                        for b2 = [0 1]                
                            constraints=[constraints, sum_36(a,b,a2,b2,x)==cons(a,b,p,q)*cons(a2,b2,p,q)];
                        end
                 end
            end
end

for b = [0 1]
            for c = [0 1]
                 for b2=[0,1]
                        for c2 = [0 1]                
                            constraints=[constraints, sum_14(b,c,b2,c2,x)==cons(b,c,p,q)*cons(b2,c2,p,q)];
                        end
                 end
            end
end

for a = [0 1]
            for c = [0 1]
                 for a2=[0,1]
                        for c2 = [0 1]                
                            constraints=[constraints, sum_25(a,c,a2,c2,x)==cons(a,c2,p,q)*cons(a2,c,p,q)];
                        end
                 end
            end
end
        options = sdpsettings('solver','mosek');
        diagnostics = optimize(constraints,[],options);
        solution = value(x);
         M(ind_p,ind_q)=diagnostics.problem;
         M_q(ind_p,ind_q)=q;
         M_p(ind_p,ind_q)=p;
         ind_q=ind_q+1;
         k=(1-q)/p;
         if diagnostics.problem == 0 && klimit>k
             klimit=k;
         end
    end
    ind_p=ind_p+1;
end
klimit
surface(M_p,M_q,M,'EdgeColor','none')


