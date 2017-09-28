%循环次数少的放在内环，外循环依次为i,j，按行优先循环
function y = ForLooPCompare1(x,m)
y(m,m)=0;
tic;
for i = 2:(m-1)
    for j = 2:(m-1)
        for k1 = -1:1
            for k2 = -1:1
                y(i,j) = y(i,j) + x(i+k1,j+k2)/9;
            end
        end
    end
end
toc

                