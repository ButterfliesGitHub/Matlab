%quadl(@(x)arrayfun(@(xx)quad2d(��������f(xx,y,z)����y,z�����ĺ��������y��������y1(xx)��y��������y2(xx),
%z��������z1(xx,y),z��������y2(xx,y)),x),x��������x1(x),x��������x2(x) �ȶ���һ
tic
y1=quadl(@(x) arrayfun(@(xx)quad2d(@(y,z)xx.*y.*z,xx,2*xx,@(y)xx*y,@(y)2*xx*y),x),1,2)
toc

%quad2d(@(x,y)arrayfun(@(xx,yy)quadl(��������f(xx,yy,z)����z�����ĺ��������z��������z1(xx,yy),z��������z(xx,yy)),x,y),
% x��������ֵ��x��������ֵ��y��������y1(x),y��������y2(x) ��һ���
tic
y2=quad2d(@(x,y)arrayfun(@(xx,yy)quadl(@(z)xx*yy*z,xx.*yy,2*xx.*yy),x,y),1,2,@(x)x,@(x)2*x)
toc

%quadl(@(x)arrayfun(@(xx)quadl(@(y)arrayfun(@(yy)quadl(������������f(xx,yy,z)����z�����ĺ��������z��������z1(xx,yy),z��������z2(xx,yy)),y��������y1��xx),y��������y2��xx)),x),x�������ޣ�x��������))

%ֻ��7.0�汾ʹ�ã�
% y3=quadl(@(x)arrayfun(@(xx)quadl(@(y)arrayfun(@(yy)quadl(@(z)xx.*yy.*zz,xx.*yy,2*xx.*yy),y),xx,2*xx),x),1,2)

