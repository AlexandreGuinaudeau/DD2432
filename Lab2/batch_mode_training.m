function units = batch_mode_training(fun, units, residual_target, use_sign)

if nargin < 3
    residual_target = 0;
end
if nargin < 4
    use_sign = 0;
end

x = (0:0.1:2*pi)';
if strcmp(fun, 'sin') == 1
    f = sin(2*x);
elseif strcmp(fun, 'square') == 1
    f = square(2*x);
elseif strcmp(fun, 'xor') == 1
    x = [0 0; 0 1; 1 0; 1 1];
    f = [0; 1; 1; 0];
end
if use_sign
    assert(max(abs(f - sign(f))) == 0)
end
        
% Run makerbf script
makerbf
Phi = calcPhi(x, m, v);
disp(m)
w = Phi\f;
y = Phi * w;
if use_sign
    residual_error = max(abs(f-sign(y)));
else
    residual_error = max(abs(f-y));
end

if residual_target > 0
    % Update the number of units until the residual value is reached
    while residual_error > residual_target
        units = units + 1;
        % Run makerbf script
        makerbf
        Phi = calcPhi(x, m, v);
        w = Phi\f;
        y = Phi * w;
        if use_sign
            residual_error = max(abs(f-sign(y)));
        else
            residual_error = max(abs(f-y));
        end
    end
end
rbfplot1(x, y, f, units, m);

end

