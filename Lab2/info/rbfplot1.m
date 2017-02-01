function ans = rbfplot1(x,y,yd,units, m)
%Plot of x, y and desired y with residual

%Find the actual output by using the calculated weight vector
subplot(2,1,1); plot(x,y,x,yd); hold on; scatter(m, zeros(size(m)));
title([' Function y and desired y, RBF-units=' int2str(units)]);
subplot(2,1,2); plot(x,yd-y); hold on; scatter(m, zeros(size(m)));
title(['Residual, max= ' num2str(max(abs(yd-y)))]);

