function rho = spearman_rho(deltas,zetas)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% input params should be columns of numbers, if they are rows switch them
% to columns
if size(deltas,1) == 1
    deltas = deltas';
    zetas = zetas';
end

sorted = sortrows([ deltas zetas ]);

% because the zeds are ordered
zeds = (linspace(1,size(deltas,2),size(deltas,2)))';

% now zedhats is the rank order of the second column
[~,zedhats] = sortrows( sorted,2 );

f1 = (zeds - zedhats);
f2 = sum(f1 .* f1);
t = size(deltas,2);

rho =1 -  ((6 * f2) / ( t * t * t - t));
end
