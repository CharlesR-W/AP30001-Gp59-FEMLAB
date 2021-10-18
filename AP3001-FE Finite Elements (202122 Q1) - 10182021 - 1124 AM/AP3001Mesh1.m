
Geometry = 'squareg'; % gives square [-1,1] x [-1,1]

%Geometry = 'circleg'; % gives unit circle centered at origin

% Geometry = 'lshapeg'; % gives L-shape

[p,e,t] = initmesh(Geometry);
pdemesh(p,e,t); % plots the geometry and mesh

[p,e,t] = refinemesh(Geometry,p,e,t); % gives gridrefinement
% 
% [p,e,t] = refinemesh(Geometry,p,e,t); % gives second gridrefinement
% 
% [p,e,t] = refinemesh(Geometry,p,e,t); % gives third gridrefinement
% 
% figure;
% pdemesh(p,e,t); % plots the geometry and mesh

x = p(1,:); y = p(2,:);

n = length(p(1,:));

elmat = t(1:3,:);
elmat = elmat';
elmatbnd = e(1:2,:);
elmatbnd = elmatbnd';

topology = 3; topologybnd = 2;
