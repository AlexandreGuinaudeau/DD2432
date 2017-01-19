function [patterns, targets] = sepdata()

clear()
% Initialization of the data points 

%two differents classes of 2d points
classA(1,:) = randn(1,100) .* 0.5 + 1.0;
classA(2,:) = randn(1,100) .* 0.5 + 0.5;
classB(1,:) = randn(1,100) .* 0.5 - 1.0;
classB(2,:) = randn(1,100) .* 0.5 + 0.0;

%definition of the pattern matrix
patterns = [classA, classB];

%defintion of the target matrix
targets = [ones(1,100),-ones(1,100)];

%Permutation of the two matrices
permute = randperm(200);
patterns = patterns(:, permute);
targets = targets(:, permute);
