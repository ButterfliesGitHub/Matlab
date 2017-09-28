%循环次数最少的在外环，行循环优先
function y = ForLooPCompare3(x,m)
y(m,m)=0;
tic;
for k1 = -1:1
    for k2 = -1:1
        for i = 2:(m-1)
            for j = 2:(m-1)
                y(i,j) = y(i,j) + x(i+k1,j+k2)/9;
            end
        end
    end
end
toc;
