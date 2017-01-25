function plot_approximation(out, ndata, max_x, min_z, max_z, t)

gridsize = floor(sqrt(ndata));  % ndata should be a perfect square
zz = reshape(out, [gridsize, gridsize]);
% Generate x, y
step_x = 2*max_x/(gridsize-1);
x = [-max_x:step_x:max_x]';
y = x;
mesh(x,y,zz);
axis([-max_x max_x -max_x max_x min_z, max_z]);
title(t)
drawnow;
