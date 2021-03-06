%This program will check what k is the limitting value for the hexagon for
%a distribution Q=(1-6p)[111111]+p{[111100]+[011110]+[001111]+[100111]+[110011]+[111001]}
p=0.00001/2;
N=6; %number of parties
Q0=zeros(2^N,1);
%I write by hand the configuration Q0 but it can be done with a loop for
%sure
Q0(64)=N*p;
Q0(16)=p; Q0(31)=p; Q0(40)=p; Q0(52)=p; Q0(58)=p; Q0(61)=p;

Q0(64)=2*N*p;
Q0(16)=2*p; Q0(31)=2*p; Q0(40)=2*p; Q0(52)=2*p; Q0(58)=2*p; Q0(61)=2*p;
klimit=100;
for k=linspace(0,50,201)

q=1-k*p;
%Check positivity and sum=1 constraints
constraints=[sum(Q0)-2*Q0(64)==0, sum(Q0>=0)==64];
%first we check constraints of the type Q(abcb')=Q(abc)P(b'), we have 3
%like this
     for a = [0 1]
            for b = [0 1]
                for c = [0 1]
                        for b2 = [0 1]
                             constraints= [constraints, abs(sum_46eps(a,b,c,b2,Q0)-cons_lin(a,b,c,b2,Q0,p,q))<=p/10];
                        end
                end
            end
     end
    
        for b = [0 1]
            for c = [0 1]
                for a2 = [0 1]
                        for c2 = [0 1]
                             constraints= [constraints, abs(sum_15eps(b,c,a2,c2,Q0)-cons_lin2(b,c,a2,c2,Q0,p,q))<=p/10];
                        end
                end
            end
  end  
        
  for a = [0 1]
            for c = [0 1]
                for a2 = [0 1]
                        for b2 = [0 1]
                             constraints= [constraints, abs(sum_26eps(a,c,a2,b2,Q0)-cons_lin3(a,c,a2,b2,Q0,p,q))<=p/10];
                        end
                end
            end
  end

  %Now we check constraints of the type Q(ab)=P(ab)        
for a=[0,1]
    for b=[0,1]
         constraints = [constraints, abs(sum_3456eps(a,b,Q0) - cons(a,b,p,q))<=0.000000000005];
    end
end

for a=[0,1]
    for c2=[0,1]
         constraints = [constraints, abs(sum_2345eps(a,c2,Q0) - cons(a,c2,p,q))<=0.05];
    end
end

for b2=[0,1]
    for c2=[0,1]
         constraints = [constraints, abs(sum_1234eps(b2,c2,Q0) - cons(b2,c2,p,q))<=0.05];
    end
end

for a2=[0,1]
    for b2=[0,1]
         constraints = [constraints, abs(sum_1236eps(a2,b2,Q0)-cons(a2,b2,p,q))<=0.05];
    end
end

for c=[0,1]
    for a2=[0,1]
         constraints = [constraints, abs(sum_1256eps(c,a2,Q0)-cons(c,a2,p,q))<=0.05];
    end
end

for b=[0,1]
    for c=[0,1]
         constraints = [constraints, abs(sum_1456eps(b,c,Q0)-cons(b,c,p,q))<=0.05];
    end
end


%We check now the constraints Q(abca'b'c')=Q(a'b'c'abc)
for a = [0 1]
            for b = [0 1]
                for c = [0 1]
                    for a2=[0,1]
                        for b2 = [0 1]
                            for c2=[0,1]
                                t=a*2^5+b*2^4+c*2^3+a2*2^2+b2*2+c2+1;
                                t2=a2*2^5+b2*2^4+c2*2^3+a*2^2+b*2+c+1;
                                constraints=[constraints, Q0(t)==Q0(t2)];
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
                            constraints=[constraints, abs(sum_36eps(a,b,a2,b2,Q0)-cons_square_lin(a,b,a2,b2,p,q))<=100*p];
                        end
                 end
            end
end

for b = [0 1]
            for c = [0 1]
                 for b2=[0,1]
                        for c2 = [0 1]                
                            constraints=[constraints, abs(sum_14eps(b,c,b2,c2,Q0)-cons_square_lin(b,c,b2,c2,p,q))<=100*p];
                        end
                 end
            end
end

for a = [0 1]
            for c = [0 1]
                 for a2=[0,1]
                        for c2 = [0 1]                
                            constraints=[constraints, abs(sum_25eps(a,c,a2,c2,Q0)-cons_square_lin(a,c2,a2,c,p,q))<=100*p];
                        end
                 end
            end
end

if k<klimit && sum(constraints)==length(constraints) && k~=0%this means that all are satisfied
    klimit=k;
end

end
klimit