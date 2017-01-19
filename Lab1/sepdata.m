function [patterns, targets] = sepdata(ndata)

% Initialization of the data points 

%two differents classes of 2d points
classA(1,:) = randn(1,ndata) .* 0.5 + 1.0;
classA(2,:) = randn(1,ndata) .* 0.5 + 0.5;
classB(1,:) = randn(1,ndata) .* 0.5 - 1.0;
classB(2,:) = randn(1,ndata) .* 0.5 + 0.0;

%definition of the pattern matrix
patterns = [classA, classB];

%defintion of the target matrix
targets = [ones(1,ndata),-ones(1,ndata)];

%Permutation of the two matrices
permute = randperm(2*ndata);
patterns = patterns(:, permute);
targets = targets(:, permute);
