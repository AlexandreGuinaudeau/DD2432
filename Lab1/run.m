function run(data_id, epochs, step_length)

%Number of iterations of the training
if nargin < 2
    epochs = 20;
end
%Definition of the step length
if nargin < 3
    step_length = 0.001;
end

if data_id == 1
    [patterns, targets] = sepdata();
elseif data_id == 2
    [patterns, targets] = nsepdata();
else
    throw(MException('MyComponent:noSuchVariable','Unknown data_id'));
end

single_layer(patterns, targets, epochs, step_length);
