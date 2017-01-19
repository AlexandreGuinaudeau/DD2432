function single_layer(patterns, targets)

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
[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);

W = randn(outsize,insize+1).*0.5;
X (1:insize,:) = patterns;
X (insize+1,:) = ones(1,ndata);
T = targets;

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
