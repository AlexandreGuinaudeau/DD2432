function [patterns, targets] = approximated_function(ndata, max_x, display)

% Force ndata to be a square value
gridsize = floor(sqrt(ndata));
ndata = gridsize * gridsize;

% Generate x, y, z
step_x = 2*max_x/(gridsize-1);
x = [-max_x:step_x:max_x]';
y = x;
z = exp(-x.*x*0.1) * exp(-y.*y*0.1)' - 0.5;

if display
    figure('Position', [50, 50, 500, 500]);
    mesh(x, y, z)
    figure('Position', [600, 50, 500, 500]);
    pause(0.5)
end

% Convert to 1-D arrays
targets = reshape (z, 1, ndata);
[xx, yy] = meshgrid (x, y);
patterns = [reshape(xx, 1, ndata); reshape(yy, 1, ndata)];
