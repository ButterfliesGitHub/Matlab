function IntDemo
    function f1 = myfun1(x)
        f1 = zeros(size(x));
        for k = 1:length(x)
            f1(k) = quadl(@(y) x(k)*y,sin(x(k)),cos(x(k)));
        en
    end
y=quadl(@myfun,1,2);
disp(['ans is: ',y]);a
end

