clear all 
precision=10;
 ind_q=1;
for q=linspace(0.996,1,precision)
    ind_p=1;
    for p=linspace(0.000001,(1-q),precision)
        M_q(ind_p,ind_q)=q;
        M_p(ind_p,ind_q)=p;
         
        ind_p=ind_p+1;
    end
    ind_q=ind_q+1;
end