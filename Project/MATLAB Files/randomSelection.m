function [selectedSpan] = randomSelection(population,selectionsNumber)

% A function that randomly selects a span of the population to then use the
% crossover method on it.

data = zeros(1,selectionsNumber);

for i=1:selectionsNumber
    data(i) = randi(size(population,1));
end
   
selectedSpan = population(data,:);

end
