%% Linear regression with batch gradient descent and normal equation

%% Feature Normalization
% Clear and Close Figures

clear ; close all; clc
fprintf('Loading data ...\n');
data = load('data.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);
% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');
[X, mu, sigma] = featureNormalize(X);
X = [ones(m, 1) X];


%% Gradient Descent 

fprintf('Running gradient descent ...\n');

% Choose some alpha value
alpha = 0.03;
num_iters = 400;

% Init Theta and Run Gradient Descent 
theta = zeros(3, 1);

[theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters);

% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');
%Prediction 
price = [1, 1200, 2] *theta;
fprintf(['Predicted price of a 1200 sq-ft, 2 br house ' ...
         '(using gradient descent):\n $%f\n'], price);

     
%% Normal Equations

fprintf('Finding normal equations...\n');
% Load Data
data = csvread('data.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);
X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
theta = normalEqn(X, y);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n');
%Prediction 
price = [1, 1200, 2] *theta; 
fprintf(['Predicted price of a 1200 sq-ft, 2 br house ' ...
         '(using normal equations):\n $%f\n'], price);

