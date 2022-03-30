%This program will check what k is the limitting value for the hexagon for
%a distribution
%Q=(1-9p)[111111]+p{[001111111]+[100111111]+[110011111]+[111001111]...
%+[111100111]+[111110011]+[111111001]+[111111100]+[011111110]}
p=0.000000001;
N=9; %number of parties
Q0=zeros(2^N,1);
%I write by hand the configuration Q0 but it can be done with a loop for
%sure
Q0(2^N)=N*p;
Q0(128)=p; Q0(320)=p; Q0(416)=p; Q0(464)=p; Q0(488)=p; Q0(500)=p; Q0(506)=p; Q0(509)=p; Q0(255)=p;

Q0(2^N)=2*N*p;
Q0(128)=2*p; Q0(320)=2*p; Q0(416)=2*p; Q0(464)=2*p; Q0(488)=2*p; Q0(500)=2*p; Q0(506)=2*p; Q0(509)=2*p; Q0(255)=2*p;
klimit=10000;
for k=linspace(0,50,201)
q=1-k*p;
%Check positivity and sum=1 constraints
constraints=[abs(sum(Q0)-2*Q0(2^N))<10^(-7), sum(Q0>=0)==2^N];

 %We check now the constraints
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
                                constraints=[constraints, Q0(t)==Q0(t2),Q0(t)==Q0(t3)];
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
         constraints = [constraints, abs(sum_3456789eps(a,b,Q0)-cons(a,b,p,q))<10^(-15)];
    end
end
%Q(bc)=P(bc)
for b=[0,1]
    for c=[0,1]
         constraints = [constraints, abs(sum_1456789eps(b,c,Q0)- cons(b,c,p,q))<10^(-15)];
    end
end
%Q(ca')=P(ca')
for c=[0,1]
    for a2=[0,1]
         constraints = [constraints, abs(sum_1256789eps(c,a2,Q0) - cons(c,a2,p,q))<10^(-15)];
    end
end
%Q(a'b')=P(a'b')
for a2=[0,1]
    for b2=[0,1]
         constraints = [constraints, abs(sum_1236789eps(a2,b2,Q0) - cons(a2,b2,p,q))<10^(-15)];
    end
end
%Q(b'c')=P(b'c')
for b2=[0,1]
    for c2=[0,1]
         constraints = [constraints, abs(sum_1234789eps(b2,c2,Q0) - cons(b2,c2,p,q))<10^(-15)];
    end
end
%Q(c'a'')=P(c'a'')
for c2=[0,1]
    for a3=[0,1]
         constraints = [constraints, abs(sum_1234589eps(c2,a3,Q0) - cons(c2,a3,p,q))<10^(-15)];
    end
end
%Q(a''b'')=P(a''b'')
for a3=[0,1]
    for b3=[0,1]
         constraints = [constraints, abs(sum_1234569eps(a3,b3,Q0) - cons(a3,b3,p,q))<10^(-15)];
    end
end
%Q(b''c'')=P(b''c'')
for b3=[0,1]
    for c3=[0,1]
         constraints = [constraints, abs(sum_1234567eps(b3,c3,Q0) - cons(b3,c3,p,q))<10^(-15)];
    end
end
%Q(ac'')=P(ac'')
for a=[0,1]
    for c3=[0,1]
         constraints = [constraints, abs(sum_2345678eps(a,c3,Q0) - cons(a,c3,p,q))<10^(-15)];
    end
end

%We check the constraints of the type Q(aba'b'a''b'')=P(ab)P(a'b')P(a''b'')
for a = [0 1]
            for b = [0 1]
                 for a2=[0,1]
                        for b2 = [0 1] 
                            for a3=[0,1]
                                for b3 = [0 1] 
                                    constraints=[constraints, abs(sum_369ringeps(a,b,a2,b2,a3,b3,Q0)-cons_third_lin(a,b,a2,b2,a3,b3,p,q))<=10^(-16)];
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
                                    constraints=[constraints, abs(sum_147ringeps(b,c,b2,c2,b3,c3,Q0)-cons_third_lin(b,c,b2,c2,b3,c3,p,q))<=10^(-16)];
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
                            constraints=[constraints, abs(sum_258ringeps(a,c,a2,c2,a3,c3,Q0)-cons_third_lin(a,c3,a2,c,a3,c2,p,q))<=10^(-16)];
                        end
                 end
            end
end


%We check constraints of the type Q(abca'b'c'b'')=Q(abca'b'c')P(b''), we have 9
 %like this but 6 of them are redundant
        for a = [0 1]
            for b = [0 1]
                for c = [0 1]
                    for a2 = [0 1]
                        for b2 = [0 1]
                            for c2 = [0 1]
                                for b3 = [0 1]
                                    constraints= [constraints, abs(sum_79ringeps(a,b,c,a2,b2,c2,b3,Q0)-cons_lin_ring(a,b,c,a2,b2,c2,b3,Q0,p,q))<=10^(-15)];
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
                                    constraints= [constraints, abs(sum_18ringeps(b,c,a2,b2,c2,a3,c3,Q0)-cons_lin_ring2(b,c,a2,b2,c2,a3,c3,Q0,p,q))<=10^(-15)];
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
                                        constraints= [constraints, abs(sum_29ringeps(a,c,a2,b2,c2,a3,b3,Q0)-cons_lin_ring3(a,c,a2,b2,c2,a3,b3,Q0,p,q))<=10^(-15)];
                                    end
                                end
                            end
                        end
                end
            end
  end 


  %Now we check constraints of the type Q(abca'c'a''b'')= Q(abca')Q(c'a''b'')

for a=[0,1]
    for b=[0,1]
        for c=[0,1]
            for a2=[0,1]
                for c2=[0,1]
                    for a3=[0,1]
                        for b3=[0,1]
                           constraints=[constraints, abs(sum_59ringeps(a,b,c,a2,c2,a3,b3,Q0)-cons_lin_2_ring(a,b,c,a2,c2,a3,b3,Q0))<=10^(-15)]; 
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
                           constraints=[constraints, abs(sum_16ringeps(b,c,a2,b2,a3,b3,c3,Q0)-cons_lin_2_ring2(b,c,a2,b2,a3,b3,c3,Q0))<=10^(-15)]; 
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
                           constraints=[constraints, abs(sum_27ringeps(a,c,a2,b2,c2,b3,c3,Q0)-cons_lin_2_ring3(a,c,a2,b2,c2,b3,c3,Q0))<=10^(-15)]; 
                        end
                    end
                end
            end
        end
    end
end
  
  
%Now we check constraints of the type Q(abca'b'a''b'')=Q(abca'b')P(a''b'')

for a=[0,1]
    for b=[0,1]
        for c=[0,1]
            for a2=[0,1]
                for b2=[0,1]
                    for a3=[0,1]
                        for b3=[0,1]
                            constraints=[constraints, abs(sum_69ringeps(a,b,c,a2,b2,a3,b3,Q0)-cons_lin_3_ring(a,b,c,a2,b2,a3,b3,Q0,p,q))<=10^(-16)];
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
                            constraints=[constraints, abs(sum_17ringeps(b,c,a2,b2,c2,b3,c3,Q0)-cons_lin_3_ring2(b,c,a2,b2,c2,b3,c3,Q0,p,q))<=10^(-16)];
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
                            constraints=[constraints, abs(sum_28ringeps(a,c,a2,b2,c2,a3,c3,Q0)-cons_lin_3_ring3(a,c,a2,b2,c2,a3,c3,Q0,p,q))<=10^(-16)];
                        end
                    end
                end
            end
        end
    end
end


%Now we check the constraints of the type Q(abcb'a''b'')=Q(abc)P(b')P(a''b'')

for a=[0,1]
    for b=[0,1]
        for c=[0,1]
            for b2=[0,1]
                for a3=[0,1]
                    for b3=[0,1]
                        constraints=[constraints, abs(sum_469ringeps(a,b,c,b2,a3,b3,Q0)-cons_lin_4_ring(a,b,c,b2,a3,b3,Q0,p,q))<=10^(-15)];
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
                        constraints=[constraints, abs(sum_157ringeps(b,c,a2,c2,b3,c3,Q0)-cons_lin_4_ring2(b,c,a2,c2,b3,c3,Q0,p,q))<=10^(-15)];
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
                        constraints=[constraints, abs(sum_268ringeps(a,c,a2,b2,a3,c3,Q0)-cons_lin_4_ring3(a,c,a2,b2,a3,c3,Q0,p,q))<=10^(-15)];
                    end
                end
            end
        end
    end
end



%{
X=['sum of constraints is ',num2str(sum(constraints))];
Y=['length of constraints is ',num2str(length(constraints))];
disp(Y)
disp(X)
%}

if k<klimit && sum(constraints)==length(constraints) && k~=0%this means that all are satisfied
    klimit=k;
end

end
klimit