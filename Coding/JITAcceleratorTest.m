function JITAcceleratorTest
u = rand(1e6,1);
v = zeros(1e6,1);
tic
    u1 = u + 1;
time = toc;
disp(['���������ķ�����ʱ���ǣ�',num2str(time),'��']);
tic
for ii = 1:1000000
    v(ii) = u(ii)+1;
end
time = toc;
disp(['��ѭ���ķ�����ʱ���ǣ�',num2str(time),'��']);
