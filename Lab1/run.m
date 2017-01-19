function run(data_id)

if data_id == 1
    [patterns, targets] = sepdata();
elseif data_id == 2
    [patterns, targets] = nsepdata();
else
    throw(MException('MyComponent:noSuchVariable','Unknown data_id'));
end

single_layer(patterns, targets);
