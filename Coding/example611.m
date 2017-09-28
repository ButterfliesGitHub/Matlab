% f(x,y)=sqrt(1000-x.^2) 在x.^2+y.^2<=10000区域内积分
tic
y = quad2d(@(x,y) sqrt(10^4-x.^2),-100,100,@(x) -sqrt(10^4-x.^2),@(x) sqrt(10^4-x.^2))
toc
 