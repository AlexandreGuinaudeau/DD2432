
size_map = 100
mpvotes;
[x,y] = meshgrid([1:10],[1:10]);
xpos = reshape(x, 1, size_map);
ypos = reshape(y, 1, size_map);
weights = rand(size_map,size(votes,2));
eta =  0.1;
pos = ones(1,349);

mpdistrict;

p = [district;0];
B=randperm(349)
for i=1:120
    neighborhood = 3-3*(i/120)
    for j=1:349
       b= votes(B(j),:);
       %b = repmat(votes(j,:),100,1);
       dist = ones(size_map,1);
       for k=1:100
          c= weights(k,:)-b;
          dist(k) = sqrt(sum(abs(c).^2)); 
       end
       [minvalue, minidx] = min(dist);
       
       a = 0;
       
       for z=1:100
           dist = abs(xpos(z)-xpos(minidx))+abs(ypos(z)-ypos(minidx));
           if dist<=neighborhood
            weights(z,:) = weights(z,:) + eta * (b - weights(z,:)); 
            a = a +1;
           end
       end
       pos(B(j))=minidx;
       end

end
    a= ones(1,100)*350;
figure
colormap(jet(32))

colormap([0 0 0; 0 0 1; 0 1 1; 1 0 1; 1 0 0; 0 1 0; 1 1 1; 1 1 0; 0 0 1; 0 1 1; 1 0 1; 1 0 0; 0 1 0; 1 1 1; 1 1 0;0 0 1; 0 1 1; 1 0 1; 1 0 0; 0 1 0; 1 1 1; 1 1 0; 0 0 1; 0 1 1; 1 0 1; 1 0 0; 0 1 0; 1 1 1; 1 1 0;0 0 1; 0 1 1; 1 0 1; 1 0 0; 0 1 0; 1 1 1; 1 1 0])

    a(pos) = 1:349;
    image(p(reshape(a,10,10))+1);
    
    
    for i=1:100
    dist = ones(1,349);
      for j=1:349
          c= weights(i,:)- votes(B(j),:);
          dist(B(j)) = sqrt(sum(abs(c).^2)); 
       end
       [minvalue, minidx] = min(dist);
    a(i)=minidx;
    end

figure

colormap(jet(32))
colormap([0 0 0; 0 0 1; 0 1 1; 1 0 1; 1 0 0; 0 1 0; 1 1 1; 1 1 0; 0 0 1; 0 1 1; 1 0 1; 1 0 0; 0 1 0; 1 1 1; 1 1 0;0 0 1; 0 1 1; 1 0 1; 1 0 0; 0 1 0; 1 1 1; 1 1 0; 0 0 1; 0 1 1; 1 0 1; 1 0 0; 0 1 0; 1 1 1; 1 1 0;0 0 1; 0 1 1; 1 0 1; 1 0 0; 0 1 0; 1 1 1; 1 1 0])
image(p(reshape(a,10,10))+1);

