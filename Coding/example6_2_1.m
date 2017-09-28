%网格法求被积函数含有积分项的一类积分,给定u，v的积分上限inf_u,inf_v，将积分区域剖分成nnXnn个小正方形，
%每个小正方形的面积乘以被积函数在正方形中心的值作为被积函数在该小区域积分的近似值，最后再对所有的这些区域求和得到最后的积分。
function INT = example6_2_1(inf_u,inf_v,nn)
%inf_u：u无穷上限的近似值
%inf_v: v无穷上限的近似值
%nn：u,v积分区间的等分个数

%等分积分区域 The spacing between the points is (x2-x1)/(n-1)
U = linspace(0,inf_u,nn+1);
V = linspace(0,inf_v,nn+1);
int = zeros(nn); %Create a nn-by-nn matrix of zeros.
for ku = 1:nn
    for kv = 1:nn
        int(ku,kv) = Tf_Integrand((U(ku)+U(ku+1))/2,(V(kv)+V(kv+1))/2)*(inf_u/nn)*(inf_v/nn);
    end
end
INT = sum(int(:));
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


        