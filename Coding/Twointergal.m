%һ�����������ػ��ּ���ģ��
%quadl(@(x)arrayfun(@(xx)quadl(@(y) ��������f(xx,y),y�Ļ�������,y�Ļ�������),x),x�Ļ�������,x�Ļ�������)
y=quadl(@(x)arrayfun(@(xx)quadl(@(y) exp(sin(xx)) * log(y),5*xx,xx.^2),x),1,2)
%�����quadl(@(x)f(x),1,2)
%f(x)֧���������룬arrayfun(@(xx)g(xx),x)
%g(xx) quadl(@(y) exp(sin(xx)*log(y),5*xx,xx.^2)
