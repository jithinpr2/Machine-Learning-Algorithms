function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost function j(theta) and gradient for logistic regression
% Usage :  J = COSTFUNCTION(theta, X, y)

% Initialize
m = length(y); % number of training examples
grad = zeros(size(theta));

templog(:,1) = log(sigmoid(X*theta));
templog(:,2) = log(1-(sigmoid(X*theta)));
tempy(:,1) = y;
tempy(:,2) = 1-y;
temp = templog.*tempy;
J = (1/m)*(-sum(temp(:,1))-sum(temp(:,2)));

grad(1,1) = (1/m)*sum((sigmoid(X*theta)-y).*X(:,1)); 
grad(2:end,1)=((1/m)*((sigmoid(X*theta)-y)'*X(:,2:end)))';

grad = grad(:);
% =============================================================

end
