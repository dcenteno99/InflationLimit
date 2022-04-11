precision=100;
N=9;
p=linspace(0.0001,0.000001,precision);
derivative_Q_k_7_9parties=zeros(2^N,precision-1);
%norm_Q_k_7=zeros(1,precision-1);
%derivative_Q_k_8=zeros(2^N,precision-1);
%norm_Q_k_8=zeros(1,precision-1);
%derivative_Q_k_9=zeros(2^N,precision-1);
%norm_Q_k_9=zeros(1,precision-1);

for i= 1:precision
    data1 = load('Q_0.0001_0.000001_k_7_prec100_9parties.mat');
    %data2 = load('Q_0.001_0.000001_k_8_prec1000.mat');
    %data3 = load('Q_0.001_0.000001_k_9_prec1000.mat');
    %data4=load('Q_0.001_0.000001_k_7_prec1000_lin.mat');
    %data5=load('Q_0.001_0.000001_k_8_prec1000_lin.mat');
    Q_k_7_9parties=data1.solution;
    %Q_k_8=data2.solution_k_8;
    %Q_k_9=data3.solution_k_9;
    derivative_Q_k_7_9parties(:,i)=(Q_k_7_9parties(:,i))/(p(i));
    %norm_Q_k_7(i)=norm(Q_k_7(:,i)-Q_k_7(:,i+1));
    
    %derivative_Q_k_8(:,i)=(Q_k_8(:,i))/(p(i));
    %norm_Q_k_8(i)=norm(Q_k_8(:,i)-Q_k_8(:,i+1));
    %derivative_Q_k_9(:,i)=(Q_k_9(:,i))/(p(i));
    %norm_Q_k_9(i)=norm(Q_k_9(:,i)-Q_k_9(:,i+1));
    
end