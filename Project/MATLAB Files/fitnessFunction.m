function mse = fitnessFunction(genes,size)

% A function that returns the mean square error (mse)
% of the approximation to the real value of the f we are using for input- 
% output data. 

u1_limits = [-1 2];
u2_limits = [-2 1];

value = 0;
points = 25;
n = points ^ 2;

for u1 = linspace(u1_limits(1),u1_limits(2),points)
    for u2 = linspace(u2_limits(1),u2_limits(2),points)

    value = value + (f_Function(u1,u2) - gaussian(u1,u2,genes,size))^2;
    end
end

mse = value / n;    % Formula for Mean Square Error
end

