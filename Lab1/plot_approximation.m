function plot_approximation(out, ndata, max_x)

gridsize = floor(sqrt(ndata));  % ndata should be a perfect square
zz = reshape(out, gridsize, gridsize);
mesh(x,y,zz);
axis([-max_x max_x -max_x max_x -0.7 0.7]);
drawnow;