function mut_pop = mutation(candidate,size,populationNumber)

% A function that randomly chooses one gene from the candidate to mutate,
% through change of the current value of the gene with a random value within its set limits.

index = randi(populationNumber);
switch(mod(index,5))
    case 1
        candidate(index,1:size) = -1 + 2 * rand; % Magnitude
    case 2
        candidate(index,1:size) = -3 + 7 * rand; % Center 1: [-3,4]
    case 3
        candidate(index,1:size) = -4 + 7 * rand; % Center 2: [-4,3]
    case 4
        candidate(index,1:size) = 0.2 + 1.1 * rand; % Standard Deviation 1: [0.2,1.3]
    case 5
        candidate(index,1:size) = 0.2 + 1.1 * rand; % Standard Deviation 2: [0.2,1.3]
end
mut_pop = candidate(index,1:size); % The individual candidate, with one of his genes changed
end