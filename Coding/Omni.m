%移动平台右上角为标号1
function [Wn,H,Odom] = Omni(Vx,Vy,Wo,angule,r,R,dt)
G = zeros(3,1);
Q = zeros(3,3);
Wn = zeros(3,1);
F = zeros(3,3);
H = zeros(3,1);
G = [Vx;Vy;Wo];
%逆运动学矩阵
Q = [cos(angule),sin(angule),R;
    -cos(angule),sin(angule),R;
    0,-1,R];
Wn = (1/r) * Q * G;
F = inv(Q);
H = r * F * Wn;
 %计算里程
X = (Vx*dt * cos(Wo*dt)) - (Vy*dt * sin(Wo*dt));
Y = (Vx*dt * sin(Wo*dt)) + (Vy*dt * cos(Wo*dt));
Th = Wo*dt;
Odom = [X;Y;Th];
end

