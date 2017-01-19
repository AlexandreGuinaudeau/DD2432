function run_double_layer(data_id, hidden, epochs, eta, alpha)

%Number of nodes in the hidden layer
if nargin < 2
    hidden = 20;
end
%Number of iterations of the training
if nargin < 3
    epochs = 20;
end
%Definition of the step length
if nargin < 4
    eta = 0.001;
end
%Definition of the step length
if nargin < 5
    alpha = 0.9;
end

if data_id == 1
    [patterns, targets] = sepdata();
elseif data_id == 2
    [patterns, targets] = nsepdata();
else
    throw(MException('MyComponent:noSuchVariable','Unknown data_id'));
end

a = double_layer(patterns, targets, hidden, epochs, eta, alpha);
disp(a)
