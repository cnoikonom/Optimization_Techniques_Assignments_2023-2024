function [f_min,f_max] = fLimits()

% A function that calculates the maximum and the mininum value of f(u1,u2) in order 
% to define the magnitude for the Gaussians through 

size = 100;
f_values = zeros(size,size);
count_u1 = 1;
for u1 = linspace(-1,2,size)
    count_u2 = 1;
    for u2 = linspace(-2,1,size)
        f_values(count_u1,count_u2) = f_Function(u1,u2);
    count_u2 = count_u2 + 1;
    end
    count_u1 = count_u1 + 1;
end
f_min = min(min(f_values));
f_max = max(max(f_values));
end
