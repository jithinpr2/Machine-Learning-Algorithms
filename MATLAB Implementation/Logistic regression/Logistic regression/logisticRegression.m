%% Logistic Regression

%% Load Data and plot the class data point
%  The first two columns contains the exam scores and the third column contains the label.
clear ; close all; clc
data = load('data1.txt');
X = data(:, [1, 2]); y = data(:, 3);
plotData(X,y);
% Labels and Legend
xlabel('Exam 1 score')
ylabel('Exam 2 score')
legend('Admitted', 'Not admitted')
hold off;


%% Compute Cost function J(theta) and use Gradient descent algorithm 
%  Setup the data matrix appropriately, and add ones for the intercept term
[m, n] = size(X);
% Add intercept term to x and X_test
X = [ones(m, 1) X];

% Initialize fitting parameters
initial_theta = zeros(n + 1, 1);

% Compute and display initial cost and gradient
[cost, grad] = costFunction(initial_theta, X, y);

fprintf('Cost at initial theta (zeros): %f\n', cost);
fprintf('Gradient at initial theta (zeros): \n');
fprintf(' %f \n', grad);


%% Optimizing using fminunc 
%  optimal parameters theta using built-in function (fminunc).
%  Set options for fminunc
options = optimset('GradObj', 'on', 'MaxIter', 400);
[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

% Print theta to screen
fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('theta: \n');
fprintf(' %f \n', theta);

% Plot Decision Boundary
plotDecisionBoundary(theta, X, y);

hold on;
% Labels and Legend
xlabel('Exam 1 score')
ylabel('Exam 2 score')
legend('Admitted', 'Not admitted')
hold off;


%% Prediction and Accuracies 
prob = sigmoid([1 65 75] * theta);
fprintf(['For a student with scores 65 and 75, admission ' ...
         'probability will be %f\n\n'], prob);
% Compute accuracy on our training set
p = predict(theta, X);

fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);


