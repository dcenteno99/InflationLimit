%clear all
diary 9_party_precision_100_qfrom0to1
precision=40;
klimit=1000;
solution=zeros(2^9,precision);
ind_p = 1;%index for each value of p
ind_q = 1;%index for each value of q
counter=0;
for q=linspace(0,1,precision)
%q=1; 
ind_p=1;
    for p=linspace(0.00001,1-q,precision)
   %q=1-7*p;
   %p=0; 
   x = sdpvar(2^9,1);
%We add positivity and sum=1 constraints     
 constraints= [sum(x)-2*x(2^9)==0, x>=0];
 
 %We add now the constraints
 %Q(abca'b'c'a''b''c'')=Q(a''b''c''abca'b'c')=Q(a'b'c'a''b''c''abc)
for a = [0 1]
            for b = [0 1]
                for c = [0 1]
                    for a2=[0,1]
                        for b2 = [0 1]
                            for c2=[0,1]
                                for a3=[0,1]
                                     for b3 = [0 1]
                                          for c3=[0,1]
                               t=a*2^8 + b*2^7 + c*2^6 + a2*2^5 + b2*2^4 + c2*2^3 + a3*2^2 + b3*2 + c3 + 1;
                                t2=a3*2^8 + b3*2^7 + c3*2^6 + a*2^5 + b*2^4 + c*2^3 + a2*2^2 + b2*2 + c2 + 1;
                                t3=a2*2^8 + b2*2^7 + c2*2^6 + a3*2^5 + b3*2^4 + c3*2^3 + a*2^2 + b*2 + c + 1;
                                constraints=[constraints, x(t)==x(t2),x(t)==x(t3)];
                                          end
                                     end
                                end
                            end
                         end
                    end
                end
            end
end

%Now we add constraints of the type Q(ab)=P(ab)        
for a=[0,1]
    for b=[0,1]
         constraints = [constraints, sum_3456789eps(a,b,x) == cons(a,b,p,q)];
    end
end
%Q(bc)=P(bc)
for b=[0,1]
    for c=[0,1]
         constraints = [constraints, sum_1456789eps(b,c,x) == cons(b,c,p,q)];
    end
end
%Q(ca')=P(ca')
for c=[0,1]
    for a2=[0,1]
         constraints = [constraints, sum_1256789eps(c,a2,x) == cons(c,a2,p,q)];
    end
end
%{
%Q(a'b')=P(a'b')
for a2=[0,1]
    for b2=[0,1]
         constraints = [constraints, sum_1236789eps(a2,b2,x) == cons(a2,b2,p,q)];
    end
end
%Q(b'c')=P(b'c')
for b2=[0,1]
    for c2=[0,1]
         constraints = [constraints, sum_1234789eps(b2,c2,x) == cons(b2,c2,p,q)];
    end
end
%Q(c'a'')=P(c'a'')
for c2=[0,1]
    for a3=[0,1]
         constraints = [constraints, sum_1234589eps(c2,a3,x) == cons(c2,a3,p,q)];
    end
end
%Q(a''b'')=P(a''b'')
for a3=[0,1]
    for b3=[0,1]
         constraints = [constraints, sum_1234569eps(a3,b3,x) == cons(a3,b3,p,q)];
    end
end
%Q(b''c'')=P(b''c'')
for b3=[0,1]
    for c3=[0,1]
         constraints = [constraints, sum_1234567eps(b3,c3,x) == cons(b3,c3,p,q)];
    end
end
%Q(ac'')=P(ac'')
for a=[0,1]
    for c3=[0,1]
         constraints = [constraints, sum_2345678eps(a,c3,x) == cons(a,c3,p,q)];
    end
end
%}
%{
%Finally we add the constraints of the type
%Q(aba'b'a''b'')=P(ab)P(a'b')P(a''b'')
for a = [0 1]
            for b = [0 1]
                 for a2=[0,1]
                        for b2 = [0 1] 
                            for a3=[0,1]
                                for b3 = [0 1] 
                                    constraints=[constraints, abs(sum_369ringeps(a,b,a2,b2,a3,b3,x)-cons_third_lin(a,b,a2,b2,a3,b3,p,q))<=0.05];
                                end
                            end
                        end
                 end
            end
end
%Q(bcb'c'b''c'')=P(bc)P(b'c')P(b''c'')
for b = [0 1]
            for c = [0 1]
                 for b2=[0,1]
                        for c2 = [0 1]
                            for b3=[0,1]
                                for c3 = [0 1]
                                    constraints=[constraints, abs(sum_147ringeps(b,c,b2,c2,b3,c3,x)-cons_third_lin(b,c,b2,c2,b3,c3,p,q))<=0.05];
                                end
                            end
                        end
                 end
            end
end
%Q(aca'c'a''c'')=P(ac'')P(a'c)P(a''c')
for a = [0 1]
            for c = [0 1]
                 for a2=[0,1]
                        for c2 = [0 1]                
                            constraints=[constraints, abs(sum_258ringeps(a,c,a2,c2,a3,c3,x)-cons_third_lin(a,c3,a2,c,a3,c2,p,q))<=0.05];
                        end
                 end
            end
end
%}
%We add constraints of the type Q(abca'b'c'b'')=Q(abca'b'c')P(b''), we have 9
 %like this but 6 of them are redundant
        for a = [0 1]
            for b = [0 1]
                for c = [0 1]
                    for a2 = [0 1]
                        for b2 = [0 1]
                            for c2 = [0 1]
                                for b3 = [0 1]
                                    constraints= [constraints, abs(sum_79ringeps(a,b,c,a2,b2,c2,b3,x)-cons_lin_ring(a,b,c,a2,b2,c2,b3,x,p,q))<=0.000001];
                                end
                            end
                        end
                     end
                end
            end
        end
        
  %Q(bca'b'c'a''c'')=Q(bca'b'c'a'')P(c'')      
  for b = [0 1]
            for c = [0 1]
                for a2 = [0 1]
                    for b2=[0,1]
                        for c2 = [0 1]
                            for a3=[0,1]
                                for c3=[0,1]
                                    constraints= [constraints, abs(sum_18ringeps(b,c,a2,b2,c2,a3,c3,x)-cons_lin_ring2(b,c,a2,b2,c2,a3,c3,x,p,q))<=0.000001];
                                end
                            end
                        end
                    end
                end
            end
  end  
  % Q(aca'b'c'a''b'')=Q(ca'b'c'a''b'')P(a)     
  for a = [0 1]
            for c = [0 1]
                for a2 = [0 1]
                        for b2 = [0 1]
                            for c2=[0,1]
                                for a3=[0,1]
                                    for b3=[0,1]
                                        constraints= [constraints, abs(sum_29ringeps(a,c,a2,b2,c2,a3,b3,x)-cons_lin_ring3(a,c,a2,b2,c2,a3,b3,x,p,q))<=0.000001];
                                    end
                                end
                            end
                        end
                end
            end
  end 
   
  
%Now we add constraints of the type Q(abca'c'a''b'')= Q(abca')Q(c'a''b'')

for a=[0,1]
    for b=[0,1]
        for c=[0,1]
            for a2=[0,1]
                for c2=[0,1]
                    for a3=[0,1]
                        for b3=[0,1]
                           constraints=[constraints, abs(sum_59ringeps(a,b,c,a2,c2,a3,b3,x)-cons_lin_2_ring(a,b,c,a2,c2,a3,b3,x))<=0.05]; 
                        end
                    end
                end
            end
        end
    end
end
%Q(bca'b'a''b''c'')= Q(bca'b')Q(a''b''c'')
for b=[0,1]
    for c=[0,1]
        for a2=[0,1]
            for b2=[0,1]
                for a3=[0,1]
                    for b3=[0,1]
                        for c3=[0,1]
                           constraints=[constraints, abs(sum_16ringeps(b,c,a2,b2,a3,b3,c3,x)-cons_lin_2_ring2(b,c,a2,b2,a3,b3,c3,x))<=0.05]; 
                        end
                    end
                end
            end
        end
    end
end
%Q(aca'b'c'b''c'')= Q(ca'b'c')Q(ab''c'')
for a=[0,1]
    for c=[0,1]
        for a2=[0,1]
            for b2=[0,1]
                for c2=[0,1]
                    for b3=[0,1]
                        for c3=[0,1]
                           constraints=[constraints, abs(sum_27ringeps(a,c,a2,b2,c2,b3,c3,x)-cons_lin_2_ring3(a,c,a2,b2,c2,b3,c3,x))<=0.05]; 
                        end
                    end
                end
            end
        end
    end
end

%Now we add constraints of the type Q(abca'b'a''b'')=Q(abca'b')P(a''b'')

for a=[0,1]
    for b=[0,1]
        for c=[0,1]
            for a2=[0,1]
                for b2=[0,1]
                    for a3=[0,1]
                        for b3=[0,1]
                            constraints=[constraints, abs(sum_69ringeps(a,b,c,a2,b2,a3,b3,x)-cons_lin_3_ring(a,b,c,a2,b2,a3,b3,x,p,q))<=0.05];
                        end
                    end
                end
            end
        end
    end
end

%Q(bca'b'c'b''c'')=Q(bca'b'c')P(b''c'')
for b=[0,1]
    for c=[0,1]
        for a2=[0,1]
            for b2=[0,1]
                for c2=[0,1]
                    for b3=[0,1]
                        for c3=[0,1]
                            constraints=[constraints, abs(sum_17ringeps(b,c,a2,b2,c2,b3,c3,x)-cons_lin_3_ring2(b,c,a2,b2,c2,b3,c3,x,p,q))<=0.05];
                        end
                    end
                end
            end
        end
    end
end

%Q(aca'b'c'a''c'')=Q(ca'b'c'a'')P(ac'')
for a=[0,1]
    for c=[0,1]
        for a2=[0,1]
            for b2=[0,1]
                for c2=[0,1]
                    for a3=[0,1]
                        for b3=[0,1]
                            constraints=[constraints, abs(sum_28ringeps(a,c,a2,b2,c2,a3,c3,x)-cons_lin_3_ring3(a,c,a2,b2,c2,a3,c3,x,p,q))<=0.05];
                        end
                    end
                end
            end
        end
    end
end

%Now we add the constraints of the type Q(abcb'a''b'')=Q(abc)P(b')P(a''b'')
%{
for a=[0,1]
    for b=[0,1]
        for c=[0,1]
            for b2=[0,1]
                for a3=[0,1]
                    for b3=[0,1]
                        constraints=[constraints, abs(sum_469ringeps(a,b,c,b2,a3,b3,x)-cons_lin_4_ring(a,b,c,b2,a3,b3,x,p,q))<=0.05];
                    end
                end
            end
        end
    end
end
%Q(bca'c'b''c'')=Q(bca')P(c')P(b''c'')
for b=[0,1]
    for c=[0,1]
        for a2=[0,1]
            for c2=[0,1]
                for b3=[0,1]
                    for c3=[0,1]
                        constraints=[constraints, abs(sum_157ringeps(b,c,a2,c2,b3,c3,x)-cons_lin_4_ring2(b,c,a2,c2,b3,c3,x,p,q))<=0.05];
                    end
                end
            end
        end
    end
end

%Q(aca'b'a''c'')=Q(ca'b')P(a'')P(ac'')
for a=[0,1]
    for c=[0,1]
        for a2=[0,1]
            for b2=[0,1]
                for a3=[0,1]
                    for c3=[0,1]
                        constraints=[constraints, abs(sum_268ringeps(a,c,a2,b2,a3,c3,x)-cons_lin_4_ring3(a,c,a2,b2,a3,c3,x,p,q))<=0.05];
                    end
                end
            end
        end
    end
end
%}




        options = sdpsettings('solver','mosek');
        diagnostics = optimize(constraints,[],options);
        solution(:,ind_p) = value(x);
         M(ind_p,ind_q)=diagnostics.problem;
         M_q(ind_p,ind_q)=q;
         M_p(ind_p,ind_q)=p;
         ind_p=ind_p+1;
         k=(1-q)/p;
         if diagnostics.problem == 0 && klimit>k && k~=0 && k~=1
             klimit=k
         end
         counter=counter+1
   end
    ind_q=ind_q+1;
end
klimit
surface(M_p,M_q,M,'EdgeColor','none')
xlabel("p")
ylabel("q")
save('9_party_precision_100_qfrom0to1_variables')
diary off
