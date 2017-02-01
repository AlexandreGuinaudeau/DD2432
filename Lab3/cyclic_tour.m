function cyclic_tour(eta, niter, pause_time, filename)
    if nargin < 1
        eta = 0.2;
    end
    if nargin < 2
        niter = 10;
    end
    if nargin < 3
        pause_time = 0.01;
    end
    if nargin < 4
        filename = 'tsp';
    end
    filename = strcat('figures/', filename, '.gif');
    
    cities
    n_cities = 10;
    w = randn(n_cities, 2);
    neighborhood = 2;
    while neighborhood >= 0
        for t = 1 : niter
            %shuffle = randperm(n_cities);
            for i = 1 : n_cities
                % Find winner 
                c = city(i, :);
                distances = [w(:, 1) - c(1) w(:, 2) - c(2)];
                distances = sqrt(sum(abs(distances).^2,2));
                [~, u] = min(distances);
                % update winner's neighborhood
                for v = 1 : n_cities
                    if abs(mod(v-u, n_cities)) <= neighborhood
                        w(v, :) = (1 - eta) * w(v, :) + eta * c;
                    end
                end
                % Plot
                tour = [w;w(1,:)];
                plot(tour(:,1),tour(:,2),'b-*',city(:,1),city(:,2),'+')
                title(['Cyclic tour, neighborhood size=' int2str(neighborhood) ', iteration=' int2str(t)])
                pause(pause_time)
            end
            % save as gif
            frame = getframe(1);
            im = frame2im(frame);
            [imind,cm] = rgb2ind(im,256);
            if t + 1 - neighborhood == 0; % First step
                imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',0.1);
            else
                imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0.1);
            end
        end
        neighborhood = neighborhood - 1;
    end
        


end

