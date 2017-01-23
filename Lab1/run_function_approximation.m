function run_function_approximation(hidden, ndata, epochs, max_x, eta, alpha, display)

%Number of nodes in the hidden layer
if nargin < 1
    hidden = 20;
end
%Number of data points per class
if nargin < 2
    ndata = 100;
end
%Number of iterations of the training
if nargin < 3
    epochs = 20;
end
%Range of values taken by x (and y) is [-max_x, max_x]
if nargin < 4
    max_x = 5;
end
%Definition of the step length
if nargin < 5
    eta = 0.001;
end
%Definition of the step length
if nargin < 6
    alpha = 0.9;
end
%Definition of the step length
if nargin < 7
    display = 1;
end

[patterns, targets] = approximated_function(ndata, max_x, display);

a = double_layer(patterns, targets, hidden, epochs, eta, alpha, max_x);






