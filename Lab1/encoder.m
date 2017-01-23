function encoder()

    epochs = 1000

    eta = 1/10

    alpha = 0.9

    [patterns, targets] = encode_data();
    
    double_layer(patterns, targets, 3, epochs, eta, alpha);
    