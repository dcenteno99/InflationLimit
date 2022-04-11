%This script is to compare the solution obtained in the hexagon with k=7
%with the one obtained in the 9 party inflation also with k=7
precision=100;
p=linspace(0.0001,0.000001,precision);
%load the data
data=load('Q_0.0001_0.000001_k_7_prec100_lin.mat');
data1 = load('Q_0.0001_0.000001_k_7_prec100_9parties.mat');
Q_k_7_6parties=data.solution;
Q_k_7_9parties=data1.solution;
marginal_6=zeros(2^5,precision);
marginal_9=zeros(2^5,precision);
counter=0;
%I want to compare the marginal Q(abca'b') of both cases
for i=1:100
for a=[0,1]
    for b=[0,1]
        for c=[0,1]
            for a2=[0,1]
                for b2=[0,1]
                    t=2^4*a + 2^3*b + 2^2*c + 2*a2 + b2 + 1;
                    marginal_6(t,i)=sum_6eps(a,b,c,a2,b2,Q_k_7_6parties(:,i));
                    marginal_9(t,i)=sum_6789ringeps(a,b,c,a2,b2,Q_k_7_9parties(:,i));
                    if abs(marginal_6(t,i)-marginal_9(t,i))<0.0001
                        counter=counter+1
                    end
                end
            end
        end
    end
end
end