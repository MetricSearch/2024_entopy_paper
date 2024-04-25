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

% because the zeds are ordered - column of 1..length(deltas)
zeds = (linspace(1,length(deltas),length(deltas)))';

% now zedhats is the rank order of the second column
[~,zedhats] = sortrows( sorted,2 );

f1 = (zeds - zedhats);
f2 = sum(f1 .* f1);
t = length(deltas);

rho =1 -  ((6 * f2) / ( t * t * t - t));
end
