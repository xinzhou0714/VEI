clear all

syms alpha  beta gamma 

Rx=deg2rad([0,0,90,0,0,0,0,0])
Ry=deg2rad([0,0,0,0,0,-90,90,0])
Rz=deg2rad([0,0,0,0,0,0,0,0])
Px=[0,0,0,-612.9,-571.6,-61.7,61.7,0]
Py=[0,0,-86,0,0,0,0,0]
Pz=[0,38,90,21.89,2,54,54,30.5]
%syms theta [1 8]
syms q  [1 8]
T01=transl(Px(1),Py(1),Pz(1))*trotx(Rx(1))*troty(Ry(1))*trotz(Rz(1)+q1);
T12=transl(Px(2),Py(2),Pz(2))*trotx(Rx(2))*troty(Ry(2))*trotz(Rz(2)+q2);
T23=transl(Px(3),Py(3),Pz(3))*trotx(Rx(3))*troty(Ry(3))*trotz(Rz(3)+q3);
T34=transl(Px(4),Py(4),Pz(4))*trotx(Rx(4))*troty(Ry(4))*trotz(Rz(4)+q4);
T45=transl(Px(5),Py(5),Pz(5))*trotx(Rx(5))*troty(Ry(5))*trotz(Rz(5)+q5);
T56=transl(Px(6),Py(6),Pz(6))*trotx(Rx(6))*troty(Ry(6))*trotz(Rz(6)+q6);
T67=transl(Px(7),Py(7),Pz(7))*trotx(Rx(7))*troty(Ry(7))*trotz(Rz(7)+q7);
T78=transl(Px(8),Py(8),Pz(8))*trotx(Rx(8))*troty(Ry(8))*trotz(Rz(8)+q8);

T02=T01*T12
T03=T01*T12*T23
T04=T01*T12*T23*T34
T05=T01*T12*T23*T34*T45
T06=T01*T12*T23*T34*T45*T56
T07=T01*T12*T23*T34*T45*T56*T67
T08=T01*T12*T23*T34*T45*T56*T67*T78

% fid = fopen('temp6.txt','w');
% fprintf(fid,'%s',diff(T08(1,4),q6));
% fclose(fid);