function online_training(fun, units, eta, custom_itermax, custom_itersub)

if nargin < 4
    custom_itermax = 0;
end
if nargin < 5
    custom_itersub = 0;
end

x = (0:0.1:2*pi)';

makerbf
if custom_itermax > 0
    itermax = custom_itermax;
end
if custom_itersub > 0
    itersub = custom_itersub;
end
diter

end

