function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent 
% USAGE :  theta = GRADIENTDESCENT(x, y, theta, alpha, num_iters) 

% Initialize
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
tempVal = theta; % temporary variable to store theta values.
for iter = 1:num_iters
    temp = (X*theta - y);
    
    for i=1:length(theta)
        tempVal(i,1) = sum(temp.*X(:,i));
    end
    
    theta = theta - (alpha/m)*tempVal;
    % Save the cost J in every iteration can be used for analysing covergence of cost function    
    J_history(iter,1) = costFunction(X, y, theta);

end

end
