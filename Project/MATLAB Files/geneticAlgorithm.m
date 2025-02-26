function [bestCandidate, error] = geneticAlgorithm(gaussiansNum, maxGenerations, mutationChance)
tic;

populationSize = 150; 
generation = 1; 
chromosomes = gaussiansNum * 5;  
population = zeros(populationSize, chromosomes + 1);
genes = zeros(1, chromosomes);
c1_limits = [-3 4]; 
c2_limits = [-4 3];
error = inf(1, maxGenerations);
best = zeros(maxGenerations, chromosomes + 1);


[f_min,f_max] = fLimits();

% First Generation - Random values
for j = 1:populationSize
    for i = 1:5:chromosomes
        genes(i) = f_min + (f_max - f_min)*rand;    % Magnitude
        genes(i+1) = c1_limits(1) + (c1_limits(2) - c1_limits(1))*rand; % Center 1
        genes(i+2) = c2_limits(1) + (c2_limits(2) - c2_limits(1))*rand; % Center 2
        genes(i+3) = 0.2 + 1.1 * rand;  % Standard Deviation 1 
        genes(i+4) = 0.2 + 1.1 * rand;  % Standard Deviation 2
    end
    population(j,1:chromosomes) = genes;
    population(j,chromosomes+1) = fitnessFunction(genes,chromosomes);
end

% Sorting the first generation based on the fitness score of each indivual.
population = sortrows(population,chromosomes+1);

best(generation,:) = (population(1,:));
error(generation) = population(1,chromosomes+1); 
previous_error = population(1,chromosomes+1);


% Random percentages for the crossover method
bestPerc = 0.3;
randomPerc = 0.1;                             
crossoverPerc = 1 - (bestPerc + randomPerc);

bestSelections = populationSize*bestPerc;
randomSelections = populationSize*randomPerc;
crossoverSelections = populationSize*crossoverPerc;

randomStart = bestSelections +1;
randomEnd = randomStart + randomSelections - 1;

bestPopulation = population(1:bestSelections,1:chromosomes);
crossoveredPopulation = zeros(crossoverSelections, length(bestPopulation));

while ( previous_error >= 0.005 && generation <= maxGenerations)
    generation = generation + 1;

 population(randomStart:randomEnd, 1:end-1) = ...
     randomSelection(population(randomStart:end,1:chromosomes),randomSelections);

% Apply crossover on the pseudorandom part of our population that we chose.
for i=1:crossoverSelections
    randBest = [randi(size(bestPopulation,1)-1) randi(size(bestPopulation,1))];
    crossoveredPopulation(i,:) = crossover(bestPopulation(randBest(1),:),bestPopulation(randBest(2),:));
    population(randomEnd+1:end, 1:chromosomes) = crossoveredPopulation;
end

% Mutating some of the individuals
for i = 1:populationSize
    if rand * 100 < mutationChance   
       population(i,1:chromosomes) = mutation(population,chromosomes,populationSize);
    end
end

% Calculating again the fitness for each gene
for j = 1:populationSize
    population(j,chromosomes+1) = fitnessFunction(population(j,1:chromosomes),chromosomes);
end

% Sorting our population for each generation based on the fitness score 
% of each indivual.
population = sortrows(population,chromosomes+1);

best(generation,:) = (population(1,:));
error(generation) = population(1,chromosomes+1); 
previous_error = population(1,chromosomes+1);
end    

[~,index] = min(error); % Index of the generation with the lowest Mean Square Error.
bestCandidate = best(index,1:chromosomes); % Take the individual with that index

toc;
end
