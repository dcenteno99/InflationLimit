clear all
precision=10;
klimit=1000;
solution=zeros(2^6,precision);
ind_p = 1;%index for each value of p
ind_q = 1;%index for each value of q
i=1;
for q=linspace(0.996,1,precision)
%q=1;
    ind_p=1;
    %{
    for i= 1:precision
        p=linspace(0.001,0.000001,precision);
    data1 = load('Q_0.001_0.000001_k_7_prec1000.mat');
    Q_k_7=data1.solution_k_7;
    derivative_Q_k_7(:,i)=(Q_k_7(:,i))/(p(i));
    end
    %}
    
    for p=linspace(0.0000001,(1-q),precision)
       % q=1-8*p;
       %p=0;
        x = sdpvar(64,1);
        
 constraints= [sum(x)-2*x(64)==0, x>=0];
 %first we add constraints of the type Q(abcb')=Q(abc)P(b'), we have 6
 %like this
        for a = [0 1]
            for b = [0 1]
                for c = [0 1]
                        for b2 = [0 1]
                             constraints= [constraints, abs(sum_46eps(a,b,c,b2,x)-cons_lin(a,b,c,b2,x,p,q))<=0.000001];
                        end
                end
            end
        end
        
  for b = [0 1]
            for c = [0 1]
                for a2 = [0 1]
                        for c2 = [0 1]
                             constraints= [constraints, abs(sum_15eps(b,c,a2,c2,x)-cons_lin2(b,c,a2,c2,x,p,q))<=0.000001];
                        end
                end
            end
  end  
        
  for a = [0 1]
            for c = [0 1]
                for a2 = [0 1]
                        for b2 = [0 1]
                             constraints= [constraints, abs(sum_26eps(a,c,a2,b2,x)-cons_lin3(a,c,a2,b2,x,p,q))<=0.000001];
                        end
                end
            end
  end 
   %{     
for a = [0 1]
            for b = [0 1]
                for a2 = [0 1]
                        for c2 = [0 1]
                             constraints= [constraints, abs(sum_35eps(a,b,a2,c2,x)-cons_lin4(a,b,a2,c2,x,p,q))<=0.000001];
                        end
                end
            end
  end 
               
    for b = [0 1]
            for a2 = [0 1]
                for b2 = [0 1]
                        for c2 = [0 1]
                             constraints= [constraints, abs(sum_13eps(b,a2,b2,c2,x)-cons_lin5(b,a2,b2,c2,x,p,q))<=0.000001];
                        end
                end
            end
  end      
        
  for a = [0 1]
            for c = [0 1]
                for b2 = [0 1]
                        for c2 = [0 1]
                             constraints= [constraints, abs(sum_24eps(a,c,b2,c2,x)-cons_lin6(a,c,b2,c2,x,p,q))<=0.000001];
                        end
                end
            end
  end 
  %}
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
                            constraints=[constraints, abs(sum_36eps(a,b,a2,b2,x)-cons_square_lin(a,b,a2,b2,p,q))<=0.005];
                        end
                 end
            end
end

for b = [0 1]
            for c = [0 1]
                 for b2=[0,1]
                        for c2 = [0 1]                
                            constraints=[constraints, abs(sum_14eps(b,c,b2,c2,x)-cons_square_lin(b,c,b2,c2,p,q))<=0.005];
                        end
                 end
            end
end

for a = [0 1]
            for c = [0 1]
                 for a2=[0,1]
                        for c2 = [0 1]                
                            constraints=[constraints, abs(sum_25eps(a,c,a2,c2,x)-cons_square_lin(a,c2,a2,c,p,q))<=0.005];
                        end
                 end
            end
end
%constraints=[constraints, abs(x-derivative_Q_k_7(:,i))<=0.05];
    i=i+1
        options = sdpsettings('solver','mosek');
        diagnostics = optimize(constraints,[],options);
        solution(:,ind_p)= value(x);
         M(ind_p,ind_q)=diagnostics.problem
         M_q(ind_p,ind_q)=q;
         M_p(ind_p,ind_q)=p;
         ind_p=ind_p+1;
         k=(1-q)/p;
         if diagnostics.problem == 0 && klimit>k && k~=0 && k~=1
             klimit=k;
            % g=g+1
         end
    end
    ind_q=ind_q+1;
end
%j
klimit
surface(M_p,M_q,M,'EdgeColor','none')
xlabel("p")
ylabel("q")