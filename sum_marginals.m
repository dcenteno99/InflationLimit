function vout = sum_marginals(f,marg_index,varargin)
% f is a (multivariate) function
% marg_index contains the indices of marginals over which to integrate
% varargin contains the values for the remaining variables

n = length(marg_index); % name of the marginals over which we integrate
m = length(varargin); % 
nvar = n+m;

var_index = setdiff(1:nvar,marg_index);

% generate all values over which to sum for marginalization
V = cell(1,n);
%r = ones(1,n);
%T = cellfun(@(m)(0:m), num2cell(r), 'UniformOutput', false);
%[V{:}] = ndgrid(T{:}); % flexible form of [V{1},...,V{n}] = ndgrid(0:r(1),...,0:r(n))
[V{:}] = ndgrid(0:1); % hardcoded because we know all the values are equal to 0 and 1
V = cellfun(@(v)v(:),V,'UniformOutput',false);


C = cell(1,nvar);
for i=1:n
	C{marg_index(i)} = V{i};
end
for i=1:m
	C{var_index(i)} = varargin{i};
end

vout = sum(f(C{:}));


end