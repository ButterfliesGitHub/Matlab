%��ֵ��ⷨ������ֵ���;������񷨽�����������ȴֻ��ֻ������򣬣����ɱȽϴֵ�����
%���㺯���ڴ�����ڵ��ϵ�ֵ��Ȼ�����������������ϸ�������񣬸��ݴ�����ڵ��ϵĺ���
%ֵ����interp2����griddats������ֵ����ϸ����ڵ��ϵĺ���ֵ��������ϸ�����������͵õ�
%���������ڻ��������ϵĽ���ֵ.
function [INT,TfI] = example6_2_2(inf_u,inf_v,nn,mm)
%inf_u��u�������޵Ľ���ֵ
%inf_v: v�������޵Ľ���ֵ
%nn��u,v��������Ĵֵȷָ���,Ŀ�������ɲ�ֵ�ĹǼܵ�
%mm: u,v���������ϸ�ȷָ�����Ŀ���������㹻��Ĳ�ֵ���ֺ���ֵ
%ϸ��������
[UI,VI] = meshgrid((inf_u/mm:inf_u/mm:inf_u),(inf_v/mm:inf_v/mm:inf_v));
%����������
[U,V] = meshgrid(linspace(inf_u/mm,inf_u,nn),linspace(inf_v/mm,inf_v,nn));
Tf = zeros(nn);
for k = 1:nn^2
    Tf(k) = Tf_Integrand(U(k),V(k));%���ɴ�����ڵ㺯��ֵ
end
%��ֵ������ƻ���
TfI = interp2(U,V,Tf,UI,VI);
INT = TfI * inf_u * inf_v/(mm^2);
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
        temp_rel = dblquad(f_rel,0,a,0,b,InTol);
        temp_img = dblquad(f_img,0,a,0,b,InTol);
        z = (temp_rel.^2 + temp_img.^2)./sqrt(u.^2 + v.^2);
    end
end
        
