function run_function_approximation(generalization, hidden, ndata, epochs, max_x, eta, alpha)

%Number of nodes in the hidden layer
if nargin < 1
    generalization = 0;
end
%Number of nodes in the hidden layer
if nargin < 2
    hidden = 20;
end
%Number of data points per class
if nargin < 3
    ndata = 100;
end
%Number of iterations of the training
if nargin < 4
    epochs = 20;
end
%Range of values taken by x (and y) is [-max_x, max_x]
if nargin < 5
    max_x = 5;
end
%Definition of the step length
if nargin < 6
    eta = 0.001;
end
%Definition of alpha
if nargin < 7
    alpha = 0.9;
end
% Display if not generalizing (n=0)
display = generalization == 0;

[patterns, targets] = approximated_function(ndata, max_x, display);

[train_error, test_error] = double_layer(patterns, targets, hidden, epochs, eta, alpha, max_x, generalization);

if generalization > 0
    plot_errors(train_error, test_error);
end




