function f = shepard_spear(trueDists,redDists,plotTitle,xaxisTitle,yaxisTitle)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


%disp is the isotonic regression mapping from pcaDists to trueDists
disparities = lsqisotonic(trueDists,redDists);
[~,ord] = sortrows([disparities(:) trueDists(:)]);

corr = spearman_rho(trueDists,redDists);

% make the Shepard plot
f = figure;
hold on;
xlim([ min(redDists), max(redDists)]);
ylim([ min(trueDists), max(trueDists)]);
plot(redDists,trueDists,'o');
plot(disparities(ord),trueDists(ord),'-k','LineWidth',3);
% plot y = x when required....
% plot(linspace(0,max(trueDists),1000),linspace(0,max(trueDists),1000),'--k','LineWidth',3);

legend("individual measurements","isotonic regression","FontSize",14,"Location","northwest");
plotTitle(end) = strcat(plotTitle(end),"; S\rho = ", num2str(corr,4));
title(plotTitle,"FontSize",18);
xlabel(xaxisTitle,"FontSize",18);
ylabel(yaxisTitle,"FontSize",18);

hold off;


end

