function run_single_layer(data_id, ndata, epochs, step_length)

%Number of data points per class
if nargin < 2
    ndata = 100;
end
%Number of iterations of the training
if nargin < 3
    epochs = 20;
end
%Definition of the step length
if nargin < 4
    step_length = 0.001;
end

if data_id == 1
    [patterns, targets] = sepdata(ndata);
elseif data_id == 2
    [patterns, targets] = nsepdata(ndata);
else
    throw(MException('MyComponent:noSuchVariable','Unknown data_id'));
end

single_layer(patterns, targets, epochs, step_length);
clear()
