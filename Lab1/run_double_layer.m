function a = run_double_layer(data_id, hidden, ndata, epochs, eta, alpha)


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
%Definition of the step length
if nargin < 5
    eta = 0.001;
end
%Definition of the step length
if nargin < 6
    alpha = 0.9;
end

if data_id == 1
    [patterns, targets] = sepdata(ndata);
elseif data_id == 2
    [patterns, targets] = nsepdata(ndata);
else
    throw(MException('MyComponent:noSuchVariable','Unknown data_id'));
end

a = double_layer(patterns, targets, hidden, epochs, eta, alpha);
%disp(a)
%clear()
