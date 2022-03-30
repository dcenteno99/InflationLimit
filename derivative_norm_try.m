precision=10;
p=linspace(0.1,0.01,precision);
derivative_Q_k_7=zeros(2^6,precision-1);
norm_Q_k_7=zeros(1,precision-1);

for i=linspace(1,precision-1,1)
  
    %Q_k_7=data1.solution_k_7;
   % Q_k_8=data2.solution_k_8;
    Q_k_9=solution;
    
    %derivative_Q_k_7(:,i)=(Q_k_7(:,i)-Q_k_7(:,i+1))/(p(i)-p(i+1));
    %norm_Q_k_7(i)=norm(Q_k_7(:,i)-Q_k_7(:,i+1));
    %derivative_Q_k_8(:,i)=(Q_k_7(:,i)-Q_k_7(:,i+1))/(p(i)-p(i+1));
    %norm_Q_k_8(i)=norm(Q_k_7(:,i)-Q_k_7(:,i+1));
    derivative_Q_k_9(:,i)=(Q_k_9(:,i)-Q_k_9(:,i+1))/(p(i)-p(i+1));
    norm_Q_k_9(i)=norm(Q_k_9(:,i)-Q_k_9(:,i+1));
    
    
    
    
end