mutationChance = 30;
maxGen = 10000;
gaussianFuncNumber = 15;
genesSize = gaussianFuncNumber * 5;


% Calculating the best individual candidate and error progress. 

[bestCandidate,bestError] = geneticAlgorithm(gaussianFuncNumber,maxGen,mutationChance);


% Generating the plot according to the best result.

plots(bestCandidate,genesSize,bestError)

% Names of the Gaussian Functions
gaussians = {'Gaussian 1';'Gaussian 2';'Gaussian 3';'Gaussian 4';
    'Gaussian 5';'Gaussian 6';'Gaussian 7';'Gaussian 8';'Gaussian 9';
    'Gaussian 10';'Gaussian 11';'Gaussian 12';'Gaussian 13';
    'Gaussian 14';'Gaussian 15'};

A = bestCandidate(1:5:end)';        % Magnitude
c1 = bestCandidate(2:5:end)';       % Center 1 
c2 = bestCandidate(1:5:end)';       % Center 2
s1 = bestCandidate(1:5:end)';       % Standard Deviation 1
s2 = bestCandidate(1:5:end)';       % Standard Deviation 2

% Displaying elements and values of the Gaussian Functions
gaussiansTable = table(gaussians,A,c1,c2,s1,s2);
disp(gaussiansTable)
