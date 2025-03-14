% Define Functions
syms f1(x);
syms f2(x);
syms f3(x);
f1(x) = (x - 1) ^ 3 + ((x - 4) ^ 2) * cos(x);
f2(x) = exp(-2 * x) + (x - 2) ^ 2;
f3(x) = (x ^ 2) * log(0.5 * x) + (sin(0.2 * x)) ^ 2;
df1 = diff(f1);
df2 = diff(f2);
df3 = diff(f3);

% define lower and upper limits
lower = 0;
upper = 3;


% plot functions on specified range
figure("Name", "f1(x) = (x - 1) ^ 3 + ((x - 4) ^ 2) * cos(x)")
fplot(f1, [lower, upper]);
xlabel("x");
ylabel("y");
hold on;

figure("Name", "f2(x) = exp(-2 * x) + (x - 2) ^ 2")
fplot(f2, [lower, upper]);
xlabel("x");
ylabel("y");
hold on;

figure("Name", "f3(x) = (x ^ 2) * ln(0.5 * x) + (sin(0.2 * x)) ^ 2")
fplot(f3, [lower, upper]);
xlabel("x");
ylabel("y");
hold on;

% change l
n_l = 100;
start_l = 0.001;
end_l = 0.1;

ls = linspace(start_l, end_l, n_l);

iterations = zeros([n_l 3]);
calculations = zeros([n_l 3]);
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

    % count the calculations, start from 0 
    % (don't take into account initial calculations)
    calculations_1 = 0;
    calculations_2 = 0;
    calculations_3 = 0;

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
        midpoint = (upper_1 + lower_1) / 2;
        der_f1 = df1(midpoint);
        if der_f1 > 0
            upper_1 = midpoint;
        elseif der_f1 < 0
            lower_1 = midpoint;
        else
           % break the loop
           upper_1 = midpoint;
           lower_1 = midpoint;
        end

        iterations_1 = iterations_1 + 1;
        calculations_1 = calculations_1 + 1;

        lower_limits(i, iterations_1, 1) = lower_1;
        upper_limits(i, iterations_1, 1) = upper_1;
    end

    % f2
    while upper_2 - lower_2 >= l
        midpoint = (upper_2 + lower_2) / 2;
        der_f2 = df2(midpoint);
        if der_f2 > 0
           upper_2 = midpoint;
        elseif der_f2 < 0
           lower_2 = midpoint;
        else
            % break the loop
            upper_2 = midpoint;
            lower_2 = midpoint;
        end

        iterations_2 = iterations_2 + 1;
        calculations_2 = calculations_2 + 1;

        lower_limits(i, iterations_2, 2) = lower_2;
        upper_limits(i, iterations_2, 2) = upper_2;
    end

    % f3
    while upper_3 - lower_3 >= l
        midpoint = (upper_3 + lower_3) / 2;
        der_f3 = df3(midpoint);
        if der_f3 > 0
           upper_3 = midpoint;
        elseif der_f3 < 0
           lower_3 = midpoint;
        else
            % break the loop
            upper_3 = midpoint;
            lower_3 = midpoint;
        end

        iterations_3 = iterations_3 + 1;
        calculations_3 = calculations_3 + 1;

        lower_limits(i, iterations_3, 3) = lower_3;
        upper_limits(i, iterations_3, 3) = upper_3;
    end

    % save the result
    iterations(i, :) = [iterations_1 iterations_2 iterations_3];
    calculations(i, :) = [calculations_1 calculations_2 calculations_3];
end

% plot results
figure("Name", "Number of calculations")
plot(ls, calculations(:, 1), ...
    ls, calculations(:, 2), ...
    ls, calculations(:, 3) ...
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

