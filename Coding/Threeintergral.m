%quadl(@(x)arrayfun(@(xx)quad2d(被积函数f(xx,y,z)关于y,z变量的函数句柄，y积分下限y1(xx)，y积分上限y2(xx),
%z积分下限z1(xx,y),z积分上限y2(xx,y)),x),x积分上限x1(x),x积分下限x2(x) 先二后一
tic
y1=quadl(@(x) arrayfun(@(xx)quad2d(@(y,z)xx.*y.*z,xx,2*xx,@(y)xx*y,@(y)2*xx*y),x),1,2)
toc

%quad2d(@(x,y)arrayfun(@(xx,yy)quadl(被积函数f(xx,yy,z)关于z变量的函数句柄，z积分下限z1(xx,yy),z积分上限z(xx,yy)),x,y),
% x积分下限值，x积分上限值，y积分下限y1(x),y积分上限y2(x) 先一后二
tic
y2=quad2d(@(x,y)arrayfun(@(xx,yy)quadl(@(z)xx*yy*z,xx.*yy,2*xx.*yy),x,y),1,2,@(x)x,@(x)2*x)
toc

%quadl(@(x)arrayfun(@(xx)quadl(@(y)arrayfun(@(yy)quadl(被积函数关于f(xx,yy,z)关于z变量的函数句柄，z积分下限z1(xx,yy),z积分上限z2(xx,yy)),y积分下限y1（xx),y积分上限y2（xx)),x),x积分下限，x积分上限))

%只限7.0版本使用，
% y3=quadl(@(x)arrayfun(@(xx)quadl(@(y)arrayfun(@(yy)quadl(@(z)xx.*yy.*zz,xx.*yy,2*xx.*yy),y),xx,2*xx),x),1,2)

