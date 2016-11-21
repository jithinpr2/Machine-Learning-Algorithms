function g = sigmoid(z)
%SIGMOID Compute sigmoid functoon
% USAGE:  J = SIGMOID(z).
g = 1.0 ./ ( 1.0 + exp(-z)); 

end
