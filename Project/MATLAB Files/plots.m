function [] = plots(genes,size,error)

% A function that creates plots for visualization of our best candidate and comparison 
% with the f function.

size = 50;

u1 = linspace(-1, 2, size); 
u2 = linspace(-2, 1, size); 


% The plot of the approximation of the f function 

f_approx = zeros(size,size);
count_u1 = 1;
for i = u1
    count_u2 = 1;
    for j = u2
        f_approx(count_u1,count_u2) = gaussian(i,j,genes,size);
        count_u2 = count_u2 + 1;
    end
    count_u1 = count_u1 + 1;
end
figure(1)
surf(u1,u2,f_approx);
title('f(u1,u2) Αpproximation');


% The plot of the f function 

f_values = zeros(size,size);
count_u1 = 1;
    for i = u1
        count_u2 = 1;
        for j = u2
            f_values(count_u1,count_u2) = f_Function(i,j);
            count_u2 = count_u2 + 1;
        end
        count_u1 = count_u1 + 1;
    end
figure(2)
surf(u1,u2,f_values)
title('f(u1,u2) = sin(u1+u2) * sin(u2^2)');


% The error of the approximation 

% 2D Representation
figure(3)
plot(error)
title('Error');


error_values = f_values - f_approx;

% 3D Representation
figure(4)
surf(u1,u2,error_values);
title('Error 3D');


end