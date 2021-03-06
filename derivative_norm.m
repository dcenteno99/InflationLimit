precision=1000;
p=linspace(0.001,0.000001,precision);
derivative_Q_k_7=zeros(2^6,precision-1);
norm_Q_k_7=zeros(1,precision-1);
derivative_Q_k_8=zeros(2^6,precision-1);
norm_Q_k_8=zeros(1,precision-1);
derivative_Q_k_9=zeros(2^6,precision-1);
norm_Q_k_9=zeros(1,precision-1);
derivative_Q_k_7_lin=zeros(2^6,precision-1);
derivative_Q_k_8_lin=zeros(2^6,precision-1);
for i= 1:precision
    data1 = load('Q_0.001_0.000001_k_7_prec1000.mat');
    data2 = load('Q_0.001_0.000001_k_8_prec1000.mat');
    data3 = load('Q_0.001_0.000001_k_9_prec1000.mat');
    data4=load('Q_0.001_0.000001_k_7_prec1000_lin.mat');
    data5=load('Q_0.001_0.000001_k_8_prec1000_lin.mat');
    Q_k_7=data1.solution_k_7;
    Q_k_8=data2.solution_k_8;
    Q_k_9=data3.solution_k_9;
    Q_k_7_lin=data4.solution;
    Q_k_8_lin=data5.solution;
    derivative_Q_k_7(:,i)=(Q_k_7(:,i))/(p(i));
    %norm_Q_k_7(i)=norm(Q_k_7(:,i)-Q_k_7(:,i+1));
    
    derivative_Q_k_8(:,i)=(Q_k_8(:,i))/(p(i));
    %norm_Q_k_8(i)=norm(Q_k_8(:,i)-Q_k_8(:,i+1));
    derivative_Q_k_9(:,i)=(Q_k_9(:,i))/(p(i));
    %norm_Q_k_9(i)=norm(Q_k_9(:,i)-Q_k_9(:,i+1));
    
    derivative_Q_k_7_lin(:,i)=(Q_k_7_lin(:,i))/(p(i));
    derivative_Q_k_8_lin(:,i)=(Q_k_8_lin(:,i))/(p(i));
end