clear all

syms alpha  beta gamma 

Rx=deg2rad([0,0,90,0,0,0,0,0]);
Ry=deg2rad([0,0,0,0,0,-90,90,0]);
Rz=deg2rad([0,0,0,0,0,0,0,0]);
Px=[0,0,0,-612.9,-571.6,-61.7,61.7,0];
Py=[0,0,-86,0,0,0,0,0];
Pz=[0,38,90,21.89,2,54,54,30.5];
%syms theta [1 8]
%syms q  [1 8]
% T01=transl(Px(1),Py(1),Pz(1))*trotx(Rx(1))*troty(Ry(1))*trotz(Rz(1)+q1);
% T12=transl(Px(2),Py(2),Pz(2))*trotx(Rx(2))*troty(Ry(2))*trotz(Rz(2)+q2);
% T23=transl(Px(3),Py(3),Pz(3))*trotx(Rx(3))*troty(Ry(3))*trotz(Rz(3)+q3);
% T34=transl(Px(4),Py(4),Pz(4))*trotx(Rx(4))*troty(Ry(4))*trotz(Rz(4)+q4);
% T45=transl(Px(5),Py(5),Pz(5))*trotx(Rx(5))*troty(Ry(5))*trotz(Rz(5)+q5);
% T56=transl(Px(6),Py(6),Pz(6))*trotx(Rx(6))*troty(Ry(6))*trotz(Rz(6)+q6);
% T67=transl(Px(7),Py(7),Pz(7))*trotx(Rx(7))*troty(Ry(7))*trotz(Rz(7)+q7);
% T78=transl(Px(8),Py(8),Pz(8))*trotx(Rx(8))*troty(Ry(8))*trotz(Rz(8)+q8);
syms q1 q2 q3 q4 q5 q6 q7 q8
T01=transl(Px(1),Py(1),Pz(1))*trotx(Rx(1))*troty(Ry(1))*trotz(Rz(1)+q1);
T12=transl(Px(2),Py(2),Pz(2))*trotx(Rx(2))*troty(Ry(2))*trotz(Rz(2)+q2);
T23=transl(Px(3),Py(3),Pz(3))*trotx(Rx(3))*troty(Ry(3))*trotz(Rz(3)+q3);
T34=transl(Px(4),Py(4),Pz(4))*trotx(Rx(4))*troty(Ry(4))*trotz(Rz(4)+q4);
T45=transl(Px(5),Py(5),Pz(5))*trotx(Rx(5))*troty(Ry(5))*trotz(Rz(5)+q5);
T56=transl(Px(6),Py(6),Pz(6))*trotx(Rx(6))*troty(Ry(6))*trotz(Rz(6)+q6);
T67=transl(Px(7),Py(7),Pz(7))*trotx(Rx(7))*troty(Ry(7))*trotz(Rz(7)+q7);
T78=transl(Px(8),Py(8),Pz(8))*trotx(Rx(8))*troty(Ry(8))*trotz(Rz(8)+q8);

%q1=0;
%q2=deg2rad(37);
%q3=deg2rad(60);
%q4=0;
%q5=0;
%q6=0;
%q7=0;
%q8=0;

T02=T01*T12;
T03=T01*T12*T23;
T04=T01*T12*T23*T34;
T05=T01*T12*T23*T34*T45;
T06=T01*T12*T23*T34*T45*T56;
T07=T01*T12*T23*T34*T45*T56*T67;
T08=T01*T12*T23*T34*T45*T56*T67*T78;

% x(q1,q2,q3,q4,q5,q6,q7,q8)=T08(1,4);
% y(q1,q2,q3,q4,q5,q6,q7,q8)=T08(2,4);
% z(q1,q2,q3,q4,q5,q6,q7,q8)=T08(3,4);
pos=simplify(T08(1:3,4));

J=jacobian(pos,[q1,q2,q3,q4,q5,q6,q7,q8]);
J_11=J(1,1)
J_12=J(1,2)
J_13=J(1,3)
J_14=J(1,4)
J_15=J(1,5)
J_16=J(1,6)
J_17=J(1,7)
J_18=J(1,8)

J_21=J(2,1)
J_22=J(2,2)
J_23=J(2,3)
J_24=J(2,4)
J_25=J(2,5)
J_26=J(2,6)
J_27=J(2,7)
J_28=J(2,8)

J_31=J(3,1)
J_32=J(3,2)
J_33=J(3,3)
J_34=J(3,4)
J_35=J(3,5)
J_36=J(3,6)
J_37=J(3,7)
J_38=J(3,8)
% fid = fopen('temp6.txt','w');
% fprintf(fid,'%s',diff(T08(1,4),q6));
% fclose(fid);