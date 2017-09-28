function [INT,TfInet] = rbf_calc(inf_u,inf_v,nn)
%inf_u：u无穷上限的近似值
%inf_v: v无穷上限的近似值
%nn：u,v积分区间的等分个数
[UI,VI] = meshgrid(linspace(0,inf_u,nn+1),linspace(0,inf_v,nn+1));
%生成nnXnn网格的中心点
UI = (UI(1:end-1,1:end-1)+UI(2:end,2:end))/2;
VI = (VI(1:end-1,1:end-1)+VI(2:end,2:end))/2;
%生成网络训练样本网络，样本网格均匀分布在nn*nn网格区域内，密度为UI，VI网格的1/1.5
[U,V]=meshgrid(linspace(UI(1,1),UI(1,end),nn/1.5),linspace(VI(1,1),UI(1,end),nn/1.5));
Tf = zeros(size(U));
for k =1 : length(Tf)^2
    Tf(k) = Tf_Integrand(U(k),V(k));
end
%训练网络并给出足够多的Tf_Integrand 函数点并计算积分
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
