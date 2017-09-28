%插值求解法，将插值法和均分网格法结合起来。首先粗划分积分区域，（生成比较粗的网格）
%计算函数在粗网格节点上的值，然后在上面网格基础上细化分网格，根据粗网格节点上的函数
%值利用interp2或者griddats函数插值生成细网格节点上的函数值，最后乘以细网格面积并求和得到
%整个函数在积分区域上的近似值.
function [INT,TfI] = example6_2_2(inf_u,inf_v,nn,mm)
%inf_u：u无穷上限的近似值
%inf_v: v无穷上限的近似值
%nn：u,v积分区间的粗等分个数,目的是生成插值的骨架点
%mm: u,v积分区间的细等分个数，目的是生成足够多的插值积分函数值
%细网格数据
[UI,VI] = meshgrid((inf_u/mm:inf_u/mm:inf_u),(inf_v/mm:inf_v/mm:inf_v));
%粗网格数据
[U,V] = meshgrid(linspace(inf_u/mm,inf_u,nn),linspace(inf_v/mm,inf_v,nn));
Tf = zeros(nn);
for k = 1:nn^2
    Tf(k) = Tf_Integrand(U(k),V(k));%生成粗网格节点函数值
end
%插值并求近似积分
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
        
