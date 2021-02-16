clear all

q1_deg=-10;
q2_deg=-20;
q3_deg=-30;
q4_deg=-40;
q5_deg=-50;
q6_deg=-60;

q_deg=[q1_deg,q2_deg,q3_deg,q4_deg,q5_deg,q6_deg];
q=deg2rad(q_deg);

fileName_Sim='Sim_Descriptor.csv'


%%content of fileName_Sim
% column name and unit
% |OX	 |OY    |OZ    |PX    |PY	 |PZ    |
% |------|------|------|------|------|------|
% |deg   |deg   |deg   |mm    |mm    |mm    |

% explainations:
% OX,OY,OZ: relativ orientation to his parent frame
% PX,PY,PZ: relative position to his parent frame



data_Sim=csvread(fileName_Sim,1,0);  %%

RotationXYZ=data_Sim(:,1:3);
RotationXYZ_Rad=deg2rad(RotationXYZ);
Ox=RotationXYZ_Rad(:,1);
Oy=RotationXYZ_Rad(:,2);
Oz=RotationXYZ_Rad(:,3);

TranslatXYZ=data_Sim(:,4:6);
Px=TranslatXYZ(:,1);
Py=TranslatXYZ(:,2);
Pz=TranslatXYZ(:,3);

T_w0    =T_SingleJoint(Ox(1) ,Oy(1) ,Oz(1),     Px(1) ,Py(1)	 ,Pz(1));     % Base plate relativ to world
T_01    =T_SingleJoint(Ox(2) ,Oy(2) ,Oz(2)+q(1),Px(2) ,Py(2)	 ,Pz(2));     % J1 relativ to Base plate      
T_12    =T_SingleJoint(Ox(3) ,Oy(3) ,Oz(3)+q(2),Px(3) ,Py(3)	 ,Pz(3));     % J2 relativ to J1
T_23    =T_SingleJoint(Ox(4) ,Oy(4) ,Oz(4)+q(3),Px(4) ,Py(4)	 ,Pz(4));     % J3 relativ to J2
T_34    =T_SingleJoint(Ox(5) ,Oy(5) ,Oz(5)+q(4),Px(5) ,Py(5)	 ,Pz(5));     % J4 relativ to J3
T_45    =T_SingleJoint(Ox(6) ,Oy(6) ,Oz(6)+q(5),Px(6) ,Py(6)	 ,Pz(6));     % J5 relativ to J4
T_56    =T_SingleJoint(Ox(7) ,Oy(7) ,Oz(7)+q(6),Px(7) ,Py(7)	 ,Pz(7));     % J6 relativ to J5
T_67    =T_SingleJoint(Ox(8) ,Oy(8) ,Oz(8),     Px(8) ,Py(8)	 ,Pz(8));     % Gripper relativ to J6

PoseRef_J0= T_w0*eye(4)
PoseRef_J1= T_w0*T_01*eye(4)
PoseRef_J2= T_w0*T_01*T_12*eye(4)
PoseRef_J3= T_w0*T_01*T_12*T_23*eye(4)
PoseRef_J4= T_w0*T_01*T_12*T_23*T_34*eye(4)
PoseRef_J5= T_w0*T_01*T_12*T_23*T_34*T_45*eye(4)
PoseRef_J6= T_w0*T_01*T_12*T_23*T_34*T_45*T_56*eye(4)
PoseRef_J7= T_w0*T_01*T_12*T_23*T_34*T_45*T_56*T_67*eye(4)

