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

%Visualization of the data points 
figure(1)
plot (patterns(1, find(targets>0)), ...
          patterns(2, find(targets>0)), '*', ...
          patterns(1, find(targets<0)), ...
          patterns(2, find(targets<0)), '+');
      
%Number of iterations of the training
epochs = 20;
%Definition of the step length
step_length = 0.001;
%Initialization of the coefficient matrix
W = randn(1,3).*0.5;
X (1:2,:) = patterns;
X (3,:) = ones(1,200);
T = targets;

[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);

%Training
for i = 1:epochs
    Delta_W = -step_length*(W*X-targets)*transpose(X);
    W = W+Delta_W;
    %plot of the separation
     p = W(1,1:2);
     k = -W(1, insize+1) / (p*p');
     l = sqrt(p*p');
     plot (patterns(1, find(targets>0)), ...
          patterns(2, find(targets>0)), '*', ...
          patterns(1, find(targets<0)), ...
          patterns(2, find(targets<0)), '+', ...
          [p(1), p(1)]*k + [-p(2), p(2)]/l, ...
          [p(2), p(2)]*k + [p(1), -p(1)]/l, '-');
      drawnow;
      pause(0.1)

end



