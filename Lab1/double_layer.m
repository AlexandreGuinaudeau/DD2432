function error = double_layer(patterns, targets, hidden, epochs, eta, alpha)

%Initialization of the coefficient matrix
[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);

patterns = [patterns ; ones(1,ndata)];

w = randn(hidden, insize+1) .* 0.5;
v = randn(outsize, hidden+1) .* 0.5;
dw = zeros(hidden, insize+1);
dv = zeros(outsize, hidden+1);

% Store results
error = zeros(1, epochs);

%Training
for epoch = 1:epochs
    % Forward pass
    hin = w * patterns;
    hout = [2 ./ (1+exp(-hin)) - 1 ; ones(1,ndata)];
    oin = v * hout;
    out = 2 ./ (1+exp(-oin)) - 1;
    
    % Backward pass
    delta_o = (out - targets) .* ((1 + out) .* (1 - out)) * 0.5;
    delta_h = (v' * delta_o) .* ((1 + hout) .* (1 - hout)) * 0.5;
    delta_h = delta_h(1:hidden, :);
    
    % Weight update
    dw = (dw .* alpha) - (delta_h * patterns') .* (1-alpha);
    dv = (dv .* alpha) - (delta_o * hout') .* (1-alpha);
    w = w + dw .* eta;
    v = v + dv .* eta;
    
    % compute error
    error(epoch) = sum(sum(abs(sign(out) - targets)./2));
end
