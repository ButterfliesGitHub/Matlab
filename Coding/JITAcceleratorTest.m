function JITAcceleratorTest
u = rand(1e6,1);
v = zeros(1e6,1);
tic
    u1 = u + 1;
time = toc;
disp(['用向量化的方法的时间是：',num2str(time),'秒']);
tic
for ii = 1:1000000
    v(ii) = u(ii)+1;
end
time = toc;
disp(['用循环的方法的时间是：',num2str(time),'秒']);
