function J = costFunction(X, y, theta)
%COMPUTECOST Compute cost function J(theta) for linear regression 
% USAGE :  J = costFunction(X, y, theta) 

m = length(y); % number of training examples
J = (1/(2*m))*sum((X*theta - y).^2);
% =========================================================================

end
