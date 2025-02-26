% Define and plot the requested function
syms f(x1, x2);
f(x1, x2) = (1/3) * x1^2 + 3 * x2^2;
gradf = gradient(f);

figure("Name", "Function plot");
fsurf(f);
xlabel("x1");
ylabel("x2");
zlabel("f(x1, x2)");
hold on;



% Question 1

epsilon = 0.001;
starting_point = [50 100];

% i)
step = 0.1;

% Number of steps, length, size of point in that order
points_q1_i = zeros([1 2]);

points_q1_i(1, :) = starting_point;

f_point = starting_point;
k = 1;
gradf_value = double(gradf(f_point(1), f_point(2)))';
while norm(gradf_value) >= epsilon
    f_point = f_point - step * gradf_value;
    points_q1_i(end + 1, :) = f_point;
    gradf_value = double(gradf(f_point(1), f_point(2)))';
    k = k + 1;
end

% Plots
figure("Name", "Constant step = 0.1, Starting point = (5, 10)");
fsurf(f);
hold on;
xlabel("x1");
ylabel("x2");
zlabel("f(x1, x2)");
plot3(points_q1_i(:, 1), points_q1_i(:, 2), f(points_q1_i(:, 1), points_q1_i(:, 2)), "r*");
hold on;
figure("Name", "f value at each iteration, constant step =0.1, starting point = (5, 10)");
size_zr = size(points_q1_i(:, :));
plot(1:size_zr(1), f(points_q1_i(:, 1), points_q1_i(:, 2)));
xlabel("iteration no");
ylabel("function value");
hold on;


% ii)
step = 0.3;

% Number of steps, length, size of point in that order
points_q1_ii = zeros([1 2]);

points_q1_ii(1, :) = starting_point;

f_point = starting_point;
k = 1;
gradf_value = double(gradf(f_point(1), f_point(2)))';
while norm(gradf_value) >= epsilon
    f_point = f_point - step * gradf_value;
    points_q1_ii(end + 1, :) = f_point;
    gradf_value = double(gradf(f_point(1), f_point(2)))';
    k = k + 1;
end

% Plots
figure("Name", "Constant step = 0.3, Starting point = (5, 10)");
fsurf(f);
hold on;
xlabel("x1");
ylabel("x2");
zlabel("f(x1, x2)");
plot3(points_q1_ii(:, 1), points_q1_ii(:, 2), f(points_q1_ii(:, 1), points_q1_ii(:, 2)), "r*");
hold on;
figure("Name", "f value at each iteration, constant step =0.3, starting point = (5, 10)");
size_zr = size(points_q1_ii(:, :));
plot(1:size_zr(1), f(points_q1_ii(:, 1), points_q1_ii(:, 2)));
xlabel("iteration no");
ylabel("function value");
hold on;


% iii)
step = 3;

% Number of steps, length, size of point in that order
points_q1_iii = zeros([1 2]);

points_q1_iii(1, :) = starting_point;

f_point = starting_point;
k = 1;
gradf_value = double(gradf(f_point(1), f_point(2)))';
while norm(gradf_value) >= epsilon
    f_point = f_point - step * gradf_value;
    points_q1_iii(end + 1, :) = f_point;
    gradf_value = double(gradf(f_point(1), f_point(2)))';
    k = k + 1;
end

% Plots
figure("Name", "Constant step = 3, Starting point = (5, 10)");
fsurf(f);
hold on;
xlabel("x1");
ylabel("x2");
zlabel("f(x1, x2)");
plot3(points_q1_iii(:, 1), points_q1_iii(:, 2), f(points_q1_iii(:, 1), points_q1_iii(:, 2)), "r*");
hold on;
figure("Name", "f value at each iteration, constant step =3, starting point = (5, 10)");
size_zr = size(points_q1_iii(:, :));
plot(1:size_zr(1), f(points_q1_iii(:, 1), points_q1_iii(:, 2)));
xlabel("iteration no");
ylabel("function value");
hold on;


% iv)
step = 5;

% Number of steps, length, size of point in that order
points_q1_iv = zeros([1 2]);

points_q1_iv(1, :) = starting_point;

f_point = starting_point;
k = 1;
gradf_value = double(gradf(f_point(1), f_point(2)))';
while norm(gradf_value) >= epsilon
    f_point = f_point - step * gradf_value;
    points_q1_iv(end + 1, :) = f_point;
    gradf_value = double(gradf(f_point(1), f_point(2)))';
    k = k + 1;
end

% Plots
figure("Name", "Constant step = 5, Starting point = (5, 10)");
fsurf(f);
hold on;
xlabel("x1");
ylabel("x2");
zlabel("f(x1, x2)");
plot3(points_q1_iv(:, 1), points_q1_iv(:, 2), f(points_q1_iv(:, 1), points_q1_iv(:, 2)), "r*");
hold on;
figure("Name", "f value at each iteration, constant step =5, starting point = (5, 10)");
size_zr = size(points_q1_iv(:, :));
plot(1:size_zr(1), f(points_q1_iv(:, 1), points_q1_iv(:, 2)));
xlabel("iteration no");
ylabel("function value");
hold on;


% Upper and lower limits for x1, x2
x1limits = [-10 5];
x2limits = [-8 12];




% Question 2
epsilon = 0.01;
step = 0.5;
sk = 5;
starting_point = [5 -5];

points_q2 = zeros([1 2]);
points_q2(1, :) = starting_point;

f_point = starting_point;
k = 1;
gradf_value = double(gradf(f_point(1), f_point(2)))';
while (norm(gradf_value) >= epsilon) && (k <= 50)
    x1barint = f_point - sk * gradf_value;
    [x1bar, x2bar] = projection_rect(x1barint , x1limits, x2limits);
    f_point = f_point + step * ([x1bar, x2bar] - f_point);
    points_q2(end + 1, :) = f_point;
    gradf_value = double(gradf(f_point(1), f_point(2)))';
    k = k + 1;
end

% Plots
figure("Name", "Constant step = 0.5, sk = 5, Starting point = (5, -5)");
fsurf(f);
hold on;
xlabel("x1");
ylabel("x2");
zlabel("f(x1, x2)");
plot3(points_q2(:, 1), points_q2(:, 2), f(points_q2(:, 1), points_q2(:, 2)), "r*");
hold on;
figure("Name", "f value at each iteration, constant step = 0.5, sk = 5 , starting point = (5, -5)");
size_zr = size(points_q2(:, :));
plot(1:size_zr(1), f(points_q2(:, 1), points_q2(:, 2)));
xlabel("iteration no");
ylabel("function value");
hold on;


% Question 3
epsilon = 0.01;
step = 0.1;
sk = 15;
starting_point = [-5 10];

points_q3 = zeros([1 2]);
points_q3(1, :) = starting_point;

f_point = starting_point;
k = 1;
gradf_value = double(gradf(f_point(1), f_point(2)))';
while norm(gradf_value) >= epsilon
    x1barint = f_point - sk * gradf_value;
    [x1bar, x2bar] = projection_rect(x1barint , x1limits, x2limits);
    f_point = f_point + step * ([x1bar, x2bar] - f_point);
    points_q3(end + 1, :) = f_point;
    gradf_value = double(gradf(f_point(1), f_point(2)))';
    k = k + 1;
end

% Plots
figure("Name", "Constant step = 0.1, sk = 15, Starting point = (-5, 10)");
fsurf(f);
hold on;
xlabel("x1");
ylabel("x2");
zlabel("f(x1, x2)");
plot3(points_q3(:, 1), points_q3(:, 2), f(points_q3(:, 1), points_q3(:, 2)), "r*");
hold on;
figure("Name", "f value at each iteration, constant step = 0.1, sk = 15 , starting point = (-5, 10)");
size_zr = size(points_q3(:, :));
plot(1:size_zr(1), f(points_q3(:, 1), points_q3(:, 2)));
xlabel("iteration no");
ylabel("function value");
hold on;



% Question 4
epsilon = 0.01;
step = 0.2;
sk = 0.1;
starting_point = [8 -10];

points_q4 = zeros([1 2]);
points_q4(1, :) = starting_point;

f_point = starting_point;
k = 1;
gradf_value = double(gradf(f_point(1), f_point(2)))';
while norm(gradf_value) >= epsilon
    x1barint = f_point - sk * gradf_value;
    [x1bar, x2bar] = projection_rect(x1barint , x1limits, x2limits);
    f_point = f_point + step * ([x1bar, x2bar] - f_point);
    points_q4(end + 1, :) = f_point;
    gradf_value = double(gradf(f_point(1), f_point(2)))';
    k = k + 1;
end

% Plots
figure("Name", "Constant step = 0.2, sk = 0.1, Starting point = (8, -10)");
fsurf(f);
hold on;
xlabel("x1");
ylabel("x2");
zlabel("f(x1, x2)");
plot3(points_q4(:, 1), points_q4(:, 2), f(points_q4(:, 1), points_q4(:, 2)), "r*");
hold on;
figure("Name", "f value at each iteration, constant step = 0.2, sk = 0.1 , starting point = (8, -10)");
size_zr = size(points_q4(:, :));
plot(1:size_zr(1), f(points_q4(:, 1), points_q4(:, 2)));
xlabel("iteration no");
ylabel("function value");
hold on;
