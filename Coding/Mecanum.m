%��������ϵ
%r��챰뾶��RΪ�ƶ�ƽ̨���ĵ�������ĵ�ʸ����RxΪʸ��R��x�������RyΪʸ��R��y�����
%anguleΪ���׵Ľӵع���������X���ļнǣ��ƶ�ƽ̨���Ͻ�Ϊ���1����ʱ������1,3Ϊ-45�ȣ�2,4Ϊ45��
function [Wn,H,Odom] = Mecanum(Vx,Vy,Wo,angule,r,Rx,Ry,dt)
G = zeros(3,1);
Q = zeros(4,3);
Wn = zeros(4,1);
F = zeros(3,4);
H = zeros(3,1);
Odom = zeros(3,1);
G = [Vx;Vy;Wo]
%���˶�ѧ�任����
Q = [1,tan(-angule),Rx.* tan(-angule)-Ry;
     1,tan(angule),-Rx.* tan(angule)-Ry;
     1,tan(-angule),-Rx.* tan(-angule)-(-Ry);
     1,tan(angule),Rx.* tan(angule)-(-Ry)]
 
 Wn = (1/r) * Q * G;
 F = inv((Q'*Q))* Q';
 H = r * F * Wn;
 %�������
 X = (Vx*dt * cos(Wo*dt)) - (Vy*dt * sin(Wo*dt));
 Y = (Vx*dt * sin(Wo*dt)) + (Vy*dt * cos(Wo*dt));
 Th = Wo*dt;
 Odom = [X;Y;Th];
end
 
