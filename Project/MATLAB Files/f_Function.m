function [result] = f_Function(u1,u2)

% The f(u1,u2) function used for generating the input and output data
% and for evaluation of our results.

result = sin(u1 + u2) * sin(u2^2);
end

