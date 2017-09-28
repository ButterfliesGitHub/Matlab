%右手坐标系
%r轮毂半径，R为移动平台中心到轮毂中心的矢径，Rx为矢径R的x轴分量，Ry为矢径R的y轴分量
%angule为麦伦的接地辊子轴线与X轴间的夹角，移动平台左上角为标号1，逆时针数，1,3为-45度，2,4为45度
function [Wn,H,Odom] = Mecanum(Vx,Vy,Wo,angule,r,Rx,Ry,dt)
G = zeros(3,1);
Q = zeros(4,3);
Wn = zeros(4,1);
F = zeros(3,4);
H = zeros(3,1);
Odom = zeros(3,1);
G = [Vx;Vy;Wo]
%逆运动学变换矩阵
Q = [1,tan(-angule),Rx.* tan(-angule)-Ry;
     1,tan(angule),-Rx.* tan(angule)-Ry;
     1,tan(-angule),-Rx.* tan(-angule)-(-Ry);
     1,tan(angule),Rx.* tan(angule)-(-Ry)]
 
 Wn = (1/r) * Q * G;
 F = inv((Q'*Q))* Q';
 H = r * F * Wn;
 %计算里程
 X = (Vx*dt * cos(Wo*dt)) - (Vy*dt * sin(Wo*dt));
 Y = (Vx*dt * sin(Wo*dt)) + (Vy*dt * cos(Wo*dt));
 Th = Wo*dt;
 Odom = [X;Y;Th];
end
 
