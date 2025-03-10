% Define Functions
syms f1(x);
syms f2(x);
syms f3(x);
f1(x) = (x - 1) ^ 3 + ((x - 4) ^ 2) * cos(x);
f2(x) = exp(-2 * x) + (x - 2) ^ 2;
f3(x) = (x ^ 2) * log(0.5 * x) + (sin(0.2 * x)) ^ 2;

% define lower and upper limits
lower = 0;
upper = 3;

% plot functions on specified range
figure("Name", "f1(x) = (x - 1) ^ 3 + ((x - 4) ^ 2) * cos(x)")
fplot(f1, [lower, upper]);
xlabel("x");
ylabel("f1(x)");
hold on;

figure("Name", "f2(x) = exp(-2 * x) + (x - 2) ^ 2")
fplot(f2, [lower, upper]);
xlabel("x");
ylabel("f2(x)");
hold on;

figure("Name", "f3(x) = (x ^ 2) * ln(0.5 * x) + (sin(0.2 * x)) ^ 2")
fplot(f3, [lower, upper]);
xlabel("x");
ylabel("f3(x)");
hold on;

% l = const, change e 
l_const = 0.01;
n_e = 100;
start_e = 0.00001;
end_e = (l_const / 2) - start_e;

epsilons = linspace(start_e, end_e, n_e);


iterations_const_l_variable_e = zeros([n_e 3]);
% for every e value
for i = 1:n_e
    % get epsilon
    epsilon = epsilons(i);

    % count the iterations, start from 1
    iterations_1 = 1;
    iterations_2 = 1;
    iterations_3 = 1;

    % set up search limits
    lower_1 = lower;
    upper_1 = upper;

    lower_2 = lower;
    upper_2 = upper;

    lower_3 = lower;
    upper_3 = upper;

    % implement the algorithm, run until convergence

    % f1
    while upper_1 - lower_1 >= l_const
        x_1_k = (lower_1 + upper_1) / 2 - epsilon;
        x_2_k = (lower_1 + upper_1) / 2 + epsilon;

        if f1(x_1_k) < f1(x_2_k) 
            upper_1 = x_2_k;
        else
            lower_1 = x_1_k;
        end

        iterations_1 = iterations_1 + 1;
    end

    % f2
    while upper_2 - lower_2 >= l_const
        x_1_k = (lower_2 + upper_2) / 2 - epsilon;
        x_2_k = (lower_2 + upper_2) / 2 + epsilon;

        if f2(x_1_k) < f2(x_2_k) 
            upper_2 = x_2_k;
        else
            lower_2 = x_1_k;
        end

        iterations_2 = iterations_2 + 1;
    end

    % f3
    while upper_3 - lower_3 >= l_const
        x_1_k = (lower_3 + upper_3) / 2 - epsilon;
        x_2_k = (lower_3 + upper_3) / 2 + epsilon;

        if f3(x_1_k) < f3(x_2_k) 
            upper_3 = x_2_k;
        else
            lower_3 = x_1_k;
        end

        iterations_3 = iterations_3 + 1;
    end

    % save the result
    iterations_const_l_variable_e(i, :) = [iterations_1 iterations_2 iterations_3];
end


% two calculations of the cost function per iteration, apart 
% from the last iteration, where we conduct the check of 
% the search range and then we do not calculate values
% of the cost function again

% note that we could also initialize counter variables for the 
% calculations (initialized from 0, incremented by 2 by the end of each
% iteration), however it is redundant since we track iterations anyway

figure("Name", "Number of calculations, l = 0.01, variable e")
plot(epsilons, (iterations_const_l_variable_e(:, 1) - 1) * 2, ...
    epsilons, (iterations_const_l_variable_e(:, 2) - 1) * 2, ...
    epsilons, (iterations_const_l_variable_e(:, 3) - 1) * 2 ...
    );
xlabel("e");
ylabel("calculations");
legend("f1", "f2", "f3");
hold on;

% change l, e = const
n_l = 100;
start_l = 0.005;
end_l = 0.1;

e_const = 0.001;
ls = linspace(start_l, end_l, n_l);

iterations_variable_l_const_e = zeros([n_l 3]);
lower_limits = zeros([n_l 1 3]);
upper_limits = zeros([n_l 1 3]);
% for every l value
for i = 1:n_l
    % get l
    l = ls(i);

    % count the iterations, start from 1
    iterations_1 = 1;
    iterations_2 = 1;
    iterations_3 = 1;

    % set up search limits
    lower_1 = lower;
    upper_1 = upper;

    lower_2 = lower;
    upper_2 = upper;

    lower_3 = lower;
    upper_3 = upper;

    % initialize limit storing
    lower_limits(i, 1, :) = [lower_1 lower_2 lower_3];
    upper_limits(i, 1, :) = [upper_3 upper_3 upper_3];

    % implement the algorithm, run until convergence

    % f1
    while upper_1 - lower_1 >= l
        x_1_k = (lower_1 + upper_1) / 2 - e_const;
        x_2_k = (lower_1 + upper_1) / 2 + e_const;

        if f1(x_1_k) < f1(x_2_k) 
            upper_1 = x_2_k;
        else
            lower_1 = x_1_k;
        end

        iterations_1 = iterations_1 + 1;

        lower_limits(i, iterations_1, 1) = lower_1;
        upper_limits(i, iterations_1, 1) = upper_1;
    end

    % f2
    while upper_2 - lower_2 >= l
        x_1_k = (lower_2 + upper_2) / 2 - e_const;
        x_2_k = (lower_2 + upper_2) / 2 + e_const;

        if f2(x_1_k) < f2(x_2_k) 
            upper_2 = x_2_k;
        else
            lower_2 = x_1_k;
        end

        iterations_2 = iterations_2 + 1;

        lower_limits(i, iterations_2, 2) = lower_2;
        upper_limits(i, iterations_2, 2) = upper_2;
    end

    % f3
    while upper_3 - lower_3 >= l
        x_1_k = (lower_3 + upper_3) / 2 - e_const;
        x_2_k = (lower_3 + upper_3) / 2 + e_const;

        if f3(x_1_k) < f3(x_2_k) 
            upper_3 = x_2_k;
        else
            lower_3 = x_1_k;
        end

        iterations_3 = iterations_3 + 1;
        lower_limits(i, iterations_3, 3) = lower_3;
        upper_limits(i, iterations_3, 3) = upper_3;
    end

    % save the result
    iterations_variable_l_const_e(i, :) = [iterations_1 iterations_2 iterations_3];
end

% two calculations of the cost function per iteration, apart 
% from the last iteration, where we conduct the check of 
% the search range and then we do not calculate values
% of the cost function again


figure("Name", "Number of calculations, variable l, e = 0.001")
plot(ls, (iterations_variable_l_const_e(:, 1) - 1) * 2, ...
    ls, (iterations_variable_l_const_e(:, 2) - 1) * 2, ...
    ls, (iterations_variable_l_const_e(:, 3) - 1) * 2 ...
    );
xlabel("l");
ylabel("calculations");
legend("f1", "f2", "f3");
hold on;

% plot search ranges per iteration for 3 values of l: smaller, midpoint
% value and higher value

%f1
plot_l_idx = 1;
figure("Name", "")
plot(1:iterations_variable_l_const_e(plot_l_idx, 1), lower_limits(plot_l_idx, 1:iterations_variable_l_const_e(plot_l_idx, 1), 1), ...
    1:iterations_variable_l_const_e(plot_l_idx, 1), upper_limits(plot_l_idx, 1:iterations_variable_l_const_e(plot_l_idx, 1), 1) );
hold on;
plot_l_idx = n_l / 2;
plot(1:iterations_variable_l_const_e(plot_l_idx, 1), lower_limits(plot_l_idx, 1:iterations_variable_l_const_e(plot_l_idx, 1), 1), ...
    1:iterations_variable_l_const_e(plot_l_idx, 1), upper_limits(plot_l_idx, 1:iterations_variable_l_const_e(plot_l_idx, 1), 1) );
hold on;
plot_l_idx = n_l;
plot(1:iterations_variable_l_const_e(plot_l_idx, 1), lower_limits(plot_l_idx, 1:iterations_variable_l_const_e(plot_l_idx, 1), 1), ...
    1:iterations_variable_l_const_e(plot_l_idx, 1), upper_limits(plot_l_idx, 1:iterations_variable_l_const_e(plot_l_idx, 1), 1) );
hold on;
xlabel("k");
ylabel("function value");


%f2
plot_l_idx = 1;
figure("Name", "")
plot(1:iterations_variable_l_const_e(plot_l_idx, 2), lower_limits(plot_l_idx, 1:iterations_variable_l_const_e(plot_l_idx, 2), 2), ...
    1:iterations_variable_l_const_e(plot_l_idx, 2), upper_limits(plot_l_idx, 1:iterations_variable_l_const_e(plot_l_idx, 2), 2) );
hold on;
plot_l_idx = n_l / 2;
plot(1:iterations_variable_l_const_e(plot_l_idx, 2), lower_limits(plot_l_idx, 1:iterations_variable_l_const_e(plot_l_idx, 2), 2), ...
    1:iterations_variable_l_const_e(plot_l_idx, 2), upper_limits(plot_l_idx, 1:iterations_variable_l_const_e(plot_l_idx, 2), 2) );
hold on;
plot_l_idx = n_l;
plot(1:iterations_variable_l_const_e(plot_l_idx, 2), lower_limits(plot_l_idx, 1:iterations_variable_l_const_e(plot_l_idx, 2), 2), ...
    1:iterations_variable_l_const_e(plot_l_idx, 2), upper_limits(plot_l_idx, 1:iterations_variable_l_const_e(plot_l_idx, 2), 2) );
hold on;
xlabel("k");
ylabel("function value");


%f3
plot_l_idx = 1;
figure("Name", "")
plot(1:iterations_variable_l_const_e(plot_l_idx, 3), lower_limits(plot_l_idx, 1:iterations_variable_l_const_e(plot_l_idx, 3), 3), ...
    1:iterations_variable_l_const_e(plot_l_idx, 3), upper_limits(plot_l_idx, 1:iterations_variable_l_const_e(plot_l_idx, 3), 3) );
hold on;
plot_l_idx = n_l / 2;
plot(1:iterations_variable_l_const_e(plot_l_idx, 3), lower_limits(plot_l_idx, 1:iterations_variable_l_const_e(plot_l_idx, 3), 3), ...
    1:iterations_variable_l_const_e(plot_l_idx, 3), upper_limits(plot_l_idx, 1:iterations_variable_l_const_e(plot_l_idx, 3), 3) );
hold on;
plot_l_idx = n_l;
plot(1:iterations_variable_l_const_e(plot_l_idx, 3), lower_limits(plot_l_idx, 1:iterations_variable_l_const_e(plot_l_idx, 3), 3), ...
    1:iterations_variable_l_const_e(plot_l_idx, 3), upper_limits(plot_l_idx, 1:iterations_variable_l_const_e(plot_l_idx, 3), 3) );
hold on;
xlabel("k");
ylabel("function value");


