
%
% This routine constructs the large matrices and vector.
%
% The element matrices and vectors are also dealt with.
%
% First Initialisation of large discretisation matrix, right-hand side vector

S 		= sparse(n,n); % stiffness matrix
f 		= zeros(n,1); % right-hand side vector
%
%
% First the treatment of all (triangular) elements
%
for i = 1:length(elmat(:,1)) % for all internal elements
	GenerateElementMatrix1; % Selem	
    for ind1 = 1:topology
        for ind2 = 1:topology
            S(elmat(i,ind1),elmat(i,ind2))	= S(elmat(i,ind1),elmat(i,ind2)) + Selem(ind1,ind2);
        end;
    end;

end;

% Next the boundary contributions in the right0hand-side vector
for i = 1:length(elmatbnd(:,1)); % for all boundary elements extension of mass matrix M and element vector f
    bindex= elmatbnd(i,1);
    f(bindex) = feval(g,x(bindex), y(bindex));
    S(bindex,:) = zeros(1,n);
    S(bindex,bindex)=1;
end;
