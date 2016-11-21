function [theta] = normalEqn(X, y)
%NORMALEQN Computes the closed-form solution to linear regression 

theta = pinv((X')*X)*X'*y;
% ============================================================

end
