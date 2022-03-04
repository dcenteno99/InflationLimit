%
%  Copyright : Copyright (c) MOSEK ApS, Denmark. All rights reserved.
%
%  File :      lo1.m
%
%
%
%function lo1()

C     = [0 0 0 0 0 0 0 0 0 0]'; % Cost function to maximize
A     = zeros(64,10); %Matrix with coefficients of the constraints
blc   = zeros(64,1); %lower bound for the cnstraints
for a = [-1 1]
    for b = [-1 1]
        for c = [-1 1]
            for a2 = [-1 1]
                for b2 = [-1 1]
                    for c2 = [-1 1]
                        A(2^5*((a+1)/2)+ 2^4*((b+1)/2)+ 2^3*((c+1)/2)+ 2^2*((a2+1)/2)+2^1*((b2+1)/2)+2^0*((c2+1)/2)+1,1)=a*b*c+a2*b2*c2-b*b2*(a*c+a2*c2);
                        A(2^5*((a+1)/2)+ 2^4*((b+1)/2)+ 2^3*((c+1)/2)+ 2^2*((a2+1)/2)+2^1*((b2+1)/2)+2^0*((c2+1)/2)+1,2)=b*c*a2+b2*c2*a-c*c2*(b*a2+b2*a);
                        A(2^5*((a+1)/2)+ 2^4*((b+1)/2)+ 2^3*((c+1)/2)+ 2^2*((a2+1)/2)+2^1*((b2+1)/2)+2^0*((c2+1)/2)+1,3)=c*a2*b2+c2*a*b-a*a2*(c*b2+c2*b);
                        A(2^5*((a+1)/2)+ 2^4*((b+1)/2)+ 2^3*((c+1)/2)+ 2^2*((a2+1)/2)+2^1*((b2+1)/2)+2^0*((c2+1)/2)+1,4)=a*a2*(b*c+b2*c2);
                        A(2^5*((a+1)/2)+ 2^4*((b+1)/2)+ 2^3*((c+1)/2)+ 2^2*((a2+1)/2)+2^1*((b2+1)/2)+2^0*((c2+1)/2)+1,5)=b*b2*(c*a2+c2*a);
                        A(2^5*((a+1)/2)+ 2^4*((b+1)/2)+ 2^3*((c+1)/2)+ 2^2*((a2+1)/2)+2^1*((b2+1)/2)+2^0*((c2+1)/2)+1,6)=c*c2*(a*b+a2*b2);
                        A(2^5*((a+1)/2)+ 2^4*((b+1)/2)+ 2^3*((c+1)/2)+ 2^2*((a2+1)/2)+2^1*((b2+1)/2)+2^0*((c2+1)/2)+1,7)=a*a2*b*b2*(c+c2);
                        A(2^5*((a+1)/2)+ 2^4*((b+1)/2)+ 2^3*((c+1)/2)+ 2^2*((a2+1)/2)+2^1*((b2+1)/2)+2^0*((c2+1)/2)+1,8)=b*b2*c*c2*(a+a2);
                        A(2^5*((a+1)/2)+ 2^4*((b+1)/2)+ 2^3*((c+1)/2)+ 2^2*((a2+1)/2)+2^1*((b2+1)/2)+2^0*((c2+1)/2)+1,9)=a*a2*c*c2*(b+b2);
                        A(2^5*((a+1)/2)+ 2^4*((b+1)/2)+ 2^3*((c+1)/2)+ 2^2*((a2+1)/2)+2^1*((b2+1)/2)+2^0*((c2+1)/2)+1,10)=a*b*c*a2*b2*c2;
                        blc(2^5*((a+1)/2)+ 2^4*((b+1)/2)+ 2^3*((c+1)/2)+ 2^2*((a2+1)/2)+2^1*((b2+1)/2)+2^0*((c2+1)/2)+1,1)=-1+(a+a2+b+b2+c+c2)...
                            -(a*b2+a2*b+b*c2+b2*c+a*c+a2*c2+a*a2+b*b2+c*c2)+(a*b2*c+a2*b*c2)-(a*b+a2*b2+b*c+b2*c2+c*a2+c2*a)+...
                            (a*a2*(b+b2+c+c2)+b*b2*(a+a2+c+c2)+c*c2*(a+a2+b+b2))-(a*a2*b*b2+b*b2*c*c2+a*a2*c*c2);
                        
                    end
                end
            end
        end
    end
end

%buc   = [inf]';
blx   = [-1 -1 -1 -1 -1 -1 -1 -1 -1 -1]; %lower bound for the variables
bux   = [1 1 1 1 1 1 1 1 1 1]'; %upper bound for the variables

[res] = msklpopt(C,A,blc,[],blx,bux,[],'maximize');
sol   = res.sol;

% Interior-point solution.

%sol.itr.xx'      % x solution.
%sol.itr.sux'     % Dual variables corresponding to buc.
%sol.itr.slx'     % Dual variables corresponding to blx.

% Basic solution.

F=sol.bas.xx'      % x solution in basic solution.


m=A*F'-blc %checking the solution. It is right if m>=0
