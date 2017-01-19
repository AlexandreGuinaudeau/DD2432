function a = run_single_layer(data_id, n_class_data, epochs, eta, display)

%Number of data points per class
if nargin < 2
    n_class_data = 100;
end
%Number of iterations of the training
if nargin < 3
    epochs = 20;
end
%Definition of the step length
if nargin < 4
    eta = 1/(10*n_class_data);
end

if nargin < 5
    display = 0;
end

if data_id == 1
    [patterns, targets] = sepdata(n_class_data);
elseif data_id == 2
    [patterns, targets] = nsepdata(n_class_data);
else
    throw(MException('MyComponent:noSuchVariable','Unknown data_id'));
end

a = single_layer(patterns, targets, epochs, eta, display);

%clear()
