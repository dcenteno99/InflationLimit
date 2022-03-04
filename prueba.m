
surface(M_p,M_q,M,'EdgeColor','none')
%s.EdgeColor='flat';
p=linspace(0,1,100);
for i=1:length(p)
q(i)=(432*p(i)-4)/(54*(-4374*p(i)*p(i)+162*sqrt(3)*sqrt(243*p(i)*p(i)*p(i)*p(i)+2*p(i)*p(i)*p(i))-162*p(i)-1)^(1/3))+(2/27)*(-4374*p(i)*p(i)+162*sqrt(3)*sqrt(243*p(i)*p(i)*p(i)*p(i)+2*p(i)*p(i)*p(i))-162*p(i)-1)^(1/3)+(1/27)*(27*p(i)+25);
end

%plot(p,q)
%hold on
surface(M_p,M_q,M,'EdgeColor','none')

