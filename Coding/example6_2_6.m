function fx = example6_2_6(OutTol,InTol)
%OutTol 外层dblquad精度
%IntTol 内层dblquad精度
m = 1;
n = 1;
a = 1;
b = 1;
km = 2 * m * pi/a;
kn = 2 * n * pi/b;
     function z = Tf_Integrand(u,v)
        f_rel = @(x,y)(1 - cos(km * x)).* (1-cos(kn * y)).* cos(u.* x + v.* y);
        f_img = @(x,y)(1 - cos(kn * x)).* (1-cos(kn * y)).* sin(u.* x + v.* y);
        temp_rel = dblquad(f_rel,0,a,0,b,InTol);
        temp_img = dblquad(f_img,0,a,0,b,InTol);
        z = (temp_rel.^2 + temp_img.^2)./sqrt(u.^2 + v.^2);
     end
 fx = dblquad(@(u,v)arrayfun(@(u)Tf_Integrand(u,v),u),0,40,0,40,OutTol);
end