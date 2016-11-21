function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
% Create New Figure
figure; hold on;
pos_datapoint = find(y==1); 
neg_datapoint = find(y == 0);
plot(X(pos_datapoint, 1), X(pos_datapoint, 2), 'k+','LineWidth', 2,'MarkerSize', 5);
plot(X(neg_datapoint, 1), X(neg_datapoint, 2), 'ko', 'MarkerFaceColor', 'y','MarkerSize', 5);

% =========================================================================
hold off;

end
