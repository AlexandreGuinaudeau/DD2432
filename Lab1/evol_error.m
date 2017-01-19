function evol_error(data_id, hidden_size, n_class_data, epochs, eta, alpha)

if nargin < 4
    epochs = 20
end

if nargin<5
    eta = 1/(10*n_class_data)
end


if nargin<5
    alpha = 0.9
end

if data_id == 1
    [patterns, targets] = sepdata(n_class_data);
elseif data_id == 2
    [patterns, targets] = nsepdata(n_class_data);
else
    throw(MException('MyComponent:noSuchVariable','Unknown data_id'));
end
a = zeros(1,hidden_size);
array = single_layer(patterns,targets, epochs, eta , 0);
error_single = array(end);

for i =1:hidden_size
    array = double_layer(patterns, targets, i, epochs, eta, alpha);
    a(i) = array(end);
end
x = linspace(1, hidden_size, hidden_size);
plot(x,a,x,ones(size(a))*error_single)
axis([1 hidden_size 0 1])
clear()
