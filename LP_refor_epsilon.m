%clear all
precision=1000;
klimit=1000;
solution=zeros(2^6,precision);
ind_p = 1;%index for each value of p
ind_q = 1;%index for each value of q
%for q=linspace(0.996,1,precision)
    ind_p=1;
    %q=0.999993
    for p=linspace(0.001,0.000001,precision)
        x = sdpvar(64,1);
    %p=0.001
    q=1-7*p;
 constraints= [sum(x)-2*x(64)==0, x>=0];
 %first we add constraints of the type Q(abcab')=Q(abc)P(b'), we have 6
 %like this
        for a = [0 1]
            for b = [0 1]
                for c = [0 1]
                        for b2 = [0 1]
                             constraints= [constraints, sum_46eps(a,b,c,b2,x)==sum_456eps(a,b,c,x)*cons1(b2,p,q)];
                        end
                end
            end
        end
        
  for b = [0 1]
            for c = [0 1]
                for a2 = [0 1]
                        for c2 = [0 1]
                             constraints= [constraints, sum_15eps(b,c,a2,c2,x)==sum_156eps(b,c,a2,x)*cons1(c2,p,q)];
                        end
                end
            end
  end  
        
  for a = [0 1]
            for c = [0 1]
                for a2 = [0 1]
                        for b2 = [0 1]
                             constraints= [constraints, sum_26eps(a,c,a2,b2,x)==sum_126eps(c,a2,b2,x)*cons1(a,p,q)];
                        end
                end
            end
  end 
        
for a = [0 1]
            for b = [0 1]
                for a2 = [0 1]
                        for c2 = [0 1]
                             constraints= [constraints, sum_35eps(a,b,a2,c2,x)==sum_345eps(a,b,c2,x)*cons1(a2,p,q)];
                        end
                end
            end
  end 
               
   for b = [0 1]
            for a2 = [0 1]
                for b2 = [0 1]
                        for c2 = [0 1]
                             constraints= [constraints, sum_13eps(b,a2,b2,c2,x)==sum_123eps(a2,b2,c2,x)*cons1(b,p,q)];
                        end
                end
            end
  end      
        
  for a = [0 1]
            for c = [0 1]
                for b2 = [0 1]
                        for c2 = [0 1]
                             constraints= [constraints, sum_24eps(a,c,b2,c2,x)==sum_234eps(a,b2,c2,x)*cons1(c,p,q)];
                        end
                end
            end
  end        
%Now we add constraints of the type Q(ab)=P(ab)        
for a=[0,1]
    for b=[0,1]
         constraints = [constraints, sum_3456eps(a,b,x) == cons(a,b,p,q)];
    end
end

for a=[0,1]
    for c2=[0,1]
         constraints = [constraints, sum_2345eps(a,c2,x) == cons(a,c2,p,q)];
    end
end

for b2=[0,1]
    for c2=[0,1]
         constraints = [constraints, sum_1234eps(b2,c2,x) == cons(b2,c2,p,q)];
    end
end

for a2=[0,1]
    for b2=[0,1]
         constraints = [constraints, sum_1236eps(a2,b2,x) == cons(a2,b2,p,q)];
    end
end

for c=[0,1]
    for a2=[0,1]
         constraints = [constraints, sum_1256eps(c,a2,x) == cons(c,a2,p,q)];
    end
end

for b=[0,1]
    for c=[0,1]
         constraints = [constraints, sum_1456eps(b,c,x) == cons(b,c,p,q)];
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
                            constraints=[constraints, abs(sum_36eps(a,b,a2,b2,x)-cons(a,b,p,q)*cons(a2,b2,p,q))<=0.001];
                        end
                 end
            end
end

for b = [0 1]
            for c = [0 1]
                 for b2=[0,1]
                        for c2 = [0 1]                
                            constraints=[constraints, abs(sum_14eps(b,c,b2,c2,x)-cons(b,c,p,q)*cons(b2,c2,p,q))<=0.001];
                        end
                 end
            end
end

for a = [0 1]
            for c = [0 1]
                 for a2=[0,1]
                        for c2 = [0 1]                
                            constraints=[constraints, abs(sum_25eps(a,c,a2,c2,x)-cons(a,c2,p,q)*cons(a2,c,p,q))<=0.001];
                        end
                 end
            end
end
%constraints=[constraints, abs(x-solution)>=0.000001]
        options = sdpsettings('solver','mosek');
        diagnostics = optimize(constraints,[],options);
        
        solution(:,ind_p) = value(x);
         M(ind_p,ind_q)=diagnostics.problem;
         M_q(ind_p,ind_q)=q;
         M_p(ind_p,ind_q)=p;
         ind_p=ind_p+1;
         k=(1-q)/p;
         if diagnostics.problem == 0 && klimit>k && k~=0
             klimit=k;
         end
    %end
    ind_q=ind_q+1;
end
klimit
%{
figure(3)
surface(M_p,M_q,M,'EdgeColor','None')
xlabel("p")
ylabel("q")

%}