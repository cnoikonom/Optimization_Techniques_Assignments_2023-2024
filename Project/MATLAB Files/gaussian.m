function value = gaussian(u1,u2,genes,size)

% A function that calculates value for each Gaussian.

value = 0;
for i = 1:5:size
    A = genes(i);       % Magnitude
    c1 = genes(i+1);    % Center 1
    c2 = genes(i+2);    % Center 2
    s1 = genes(i+3);    % Standard Deviation 1
    s2 = genes(i+4);    % Standard Deviation 2

    % Gaussian Formula
    power = ((u1-c1)^2/(2*s1^2)) + ((u2-c2)^2/(2*s2^2));
    value = value + A * exp(-power);
end
end

