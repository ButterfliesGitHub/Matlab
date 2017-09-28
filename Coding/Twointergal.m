%一般计算区域二重积分计算模板
%quadl(@(x)arrayfun(@(xx)quadl(@(y) 被积函数f(xx,y),y的积分下限,y的积分上限),x),x的积分下限,x的积分上限)
y=quadl(@(x)arrayfun(@(xx)quadl(@(y) exp(sin(xx)) * log(y),5*xx,xx.^2),x),1,2)
%最外层quadl(@(x)f(x),1,2)
%f(x)支持向量输入，arrayfun(@(xx)g(xx),x)
%g(xx) quadl(@(y) exp(sin(xx)*log(y),5*xx,xx.^2)
