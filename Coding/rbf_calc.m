function [INT,TfInet] = rbf_calc(inf_u,inf_v,nn)
%inf_u��u�������޵Ľ���ֵ
%inf_v: v�������޵Ľ���ֵ
%nn��u,v��������ĵȷָ���
[UI,VI] = meshgrid(linspace(0,inf_u,nn+1),linspace(0,inf_v,nn+1));
%����nnXnn��������ĵ�
UI = (UI(1:end-1,1:end-1)+UI(2:end,2:end))/2;
VI = (VI(1:end-1,1:end-1)+VI(2:end,2:end))/2;
%��������ѵ���������磬����������ȷֲ���nn*nn���������ڣ��ܶ�ΪUI��VI�����1/1.5
[U,V]=meshgrid(linspace(UI(1,1),UI(1,end),nn/1.5),linspace(VI(1,1),UI(1,end),nn/1.5));
Tf = zeros(size(U));
for k =1 : length(Tf)^2
    Tf(k) = Tf_Integrand(U(k),V(k));
end
%ѵ�����粢�����㹻���Tf_Integrand �����㲢�������
input = [U(:)';V(:)'];
output = Tf(:)';
net = newrb(input,output,0.0001,3*inf_u/nn);
TfInet = sim(net,[UI(:)';VI(:)']);
TfInet = reshape(TfInet,nn,nn);
INT = TfInet*inf_u*inf_v/(nn^2);
INT = sum(INT(:));
    function z = Tf_Integrand(u,v)
        m = 1;
        n = 1;
        a = 1;
        b = 1;
        km = 2 * m * pi/a;
        kn = 2 * n * pi/b;
        
        f_rel = @(x,y)(1 - cos(km * x)).* (1-cos(kn * y)).* cos(u.* x + v.* y);
        f_img = @(x,y)(1 - cos(kn * x)).* (1-cos(kn * y)).* sin(u.* x + v.* y);
        temp_rel = dblquad(f_rel,0,a,0,b);
        temp_img = dblquad(f_img,0,a,0,b);
        
        z = (temp_rel.^2 + temp_img.^2)./sqrt(u.^2 + v.^2);
    end
end
