function [train_error, test_error] = double_layer(patterns, targets, hidden, epochs, eta, ...
    alpha, max_x, n)

% max_x is only defined for the last application
if nargin < 7
    max_x = 0;
end
if nargin < 8
    n = 0;
end
% n is the amount of data in the training set
[~, ndata] = size(patterns);
if n==0
    n = ndata;
end
n_test = ndata - n;

test_patterns = patterns(:, n+1:end);
train_patterns = patterns(:, 1:n);
test_targets = targets(:, n+1:end);
train_targets = targets(:, 1:n);


%Initialization of the coefficient matrix
[insize, ~] = size(train_patterns);
[outsize, n_train] = size(train_targets);
min_z = floor(10*min(train_targets))/10;
max_z = ceil(10*max(train_targets))/10;

train_patterns = [train_patterns ; ones(1,n_train)];
test_patterns = [test_patterns ; ones(1,n_test)];

w = randn(hidden, insize+1) .* 0.5;
v = randn(outsize, hidden+1) .* 0.5;
dw = zeros(hidden, insize+1);
dv = zeros(outsize, hidden+1);

% Store results
train_error = zeros(1, epochs);
test_error = zeros(1, epochs);

%Training
for epoch = 1:epochs
    % Forward pass
    hin = w * train_patterns;
    hout = [2 ./ (1+exp(-hin)) - 1 ; ones(1,n_train)];
    oin = v * hout;
    out = 2 ./ (1+exp(-oin)) - 1;
    if n_test > 0
        % Forward pass for test data
        hin_test = w * test_patterns;
        hout_test = [2 ./ (1+exp(-hin_test)) - 1 ; ones(1,n_test)];
        oin_test = v * hout_test;
        out_test = 2 ./ (1+exp(-oin_test)) - 1;
    end
    
    % Backward pass
    delta_o = (out - train_targets) .* ((1 + out) .* (1 - out)) * 0.5;
    delta_h = (v' * delta_o) .* ((1 + hout) .* (1 - hout)) * 0.5;
    delta_h = delta_h(1:hidden, :);
    
    % Weight update
    dw = (dw .* alpha) - (delta_h * train_patterns') .* (1-alpha);
    dv = (dv .* alpha) - (delta_o * hout') .* (1-alpha);
    w = w + dw .* eta;
    v = v + dv .* eta;
    
    if max_x
        % For function approximation, the error is the l2 distance
        epoch_error = sum(sum(abs(out - train_targets)./2))/n_train;
        if n_test > 0
            epoch_error_test = sum(sum(abs(out_test - test_targets)./2))/n_test;
        else
            plot_approximation(out, n_train, max_x, min_z, max_z, ...
                sprintf('Epoch=%d\nError=%f', epoch, epoch_error))
        end
    else
        % Otherwise, the error is based on the number of misclassifications
        epoch_error = sum(sum(abs(sign(out) - train_targets)./2))/n_train;
        if n_test > 0
            epoch_error_test = sum(sum(abs(sign(out_test) - test_targets)./2))/n_test;
        end
    end
    
    % Store errors
    train_error(epoch) = epoch_error;
    if n_test > 0
        test_error(epoch) = epoch_error_test;
    end
end

