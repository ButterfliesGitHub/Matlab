z = @(x,y) fzero(@(z) z-sin((z * x - 0.5)^2 + x*2*y^2 - z/10) * exp(-(( x-0.5 - exp(-y+z))^2 - z/5 + 3)),1);
[X,Y] = meshgrid( -1:0.1:7,-2:0.1:2);
Z = arrayfun(@(x,y) z(x,y),X,Y);
surf(X,Y,Z)
xlabel('\fontsize{15}\fontname{times new roman}x','color','b')
ylabel('\fontsize{15}\fontname{times new roman}y','color','b')
zlabel('\fontsize{15}\fontname{times new roman}z','color','b')
title('\fontsize{15}\fontname{ËÎÌå}z(x,y)µÄº¯ÊýÍ¼Ïñ','color','r')



