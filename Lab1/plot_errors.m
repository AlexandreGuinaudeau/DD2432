function plot_errors(train, test)

figure()
epochs = length(train);
x = linspace(1, epochs, epochs);
plot(x, train, 'b', x, test, 'r')
axis([1 epochs 0 1])
legend('train', 'test')