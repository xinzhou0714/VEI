clear all

syms alpha  beta gamma 
syms Rx(alpha) 4
syms Ry(beta) 4
syms Rz(gamma) 4

syms q [1 6]
syms vx [1 6]  %%% link displacement in x direction
syms vy [1 6]  %%% link displacement in y direction
syms vz [1 6]  %%% link displacement in z direction

syms L [1 2]  %%% link length for 3DOF
H=sym("H");
syms X Y Z
%%%% Rx
Rx= @(x) trotx(x);

% Rx1_1(alpha)=1;
% Rx2_1(alpha)=0;
% Rx3_1(alpha)=0;
% Rx4_1(alpha)=0;
% 
% Rx1_2(alpha)=0;
% Rx2_2(alpha)=cos(alpha);
% Rx3_2(alpha)=sin(alpha);
% Rx4_2(alpha)=0;
% 
% Rx1_3(alpha)=0;
% Rx2_3(alpha)=-sin(alpha);
% Rx3_3(alpha)=cos(alpha);
% Rx4_3(alpha)=0;
% 
% Rx1_4(alpha)=0;
% Rx2_4(alpha)=0;
% Rx3_4(alpha)=0;
% Rx4_4(alpha)=1;

%%%% Ry
Ry= @(x) troty(x);

% Ry1_1(beta)=cos(beta);
% Ry2_1(beta)=0;
% Ry3_1(beta)=-sin(beta);
% Ry4_1(beta)=0;
% 
% Ry1_2(beta)=0;
% Ry2_2(beta)=1;
% Ry3_2(beta)=0;
% Ry4_2(beta)=0;
% 
% Ry1_3(beta)=sin(beta);
% Ry2_3(beta)=0;
% Ry3_3(beta)=cos(beta);
% Ry4_3(beta)=0;
% 
% Ry1_4(beta)=0;
% Ry2_4(beta)=0;
% Ry3_4(beta)=0;
% Ry4_4(beta)=1;


%%%% Rz
Rz= @(x) trotz(x);

% Rz1_1(gamma)=cos(gamma);
% Rz2_1(gamma)=sin(gamma);
% Rz3_1(gamma)=0;
% Rz4_1(gamma)=0;
% 
% Rz1_2(gamma)=-sin(gamma);
% Rz2_2(gamma)=cos(gamma);
% Rz3_2(gamma)=0;
% Rz4_2(gamma)=0;
% 
% Rz1_3(gamma)=0;
% Rz2_3(gamma)=0;
% Rz3_3(gamma)=1;
% Rz4_3(gamma)=0;
% 
% Rz1_4(gamma)=0;
% Rz2_4(gamma)=0;
% Rz3_4(gamma)=0;
% Rz4_4(gamma)=1;

%%%%Pure rotation
subs(Rx(alpha)* Ry(beta)*Rz(gamma));

%%%% translation+ rotation

transl(vx1,vy1,vz1)*subs(Rx(alpha)* Ry(beta)*Rz(gamma));

%%%% rotation +translation

subs(Rx(alpha)* Ry(beta)*Rz(gamma))*transl(2,3,4);


% Tb1=subs(Rz(q1))
% T12=subs(transl(L1,0,0)*Rz(q2))
% T2ee=subs(transl(L2,0,0)*Rz(q3))
% 
% 
% Tb2=subs(Tb1*T12);
% Tbee=subs(Tb1*T12*T2ee);
% 
% expand(Tbee )

% A=sym("A")

Tb1=subs(transl(0,0,H)*Rx(pi/2)*Rz(q1))
T12=subs(transl(L1,0,0)*Rz(q2))
T2ee=subs(transl(L2,0,0)*Rz(q3))

Tb2=subs(Tb1*T12)
Tbee=subs(Tb1*T12*T2ee)

x=Tbee(1,4)
y=Tbee(2,4)
z=Tbee(3,4)


Rx(pi/2)*Ry(0)*Rz(gamma)

simplify(x^2+(z-H)^2)

cq2=sym("cq2")  %% cos(q2)

cq2=solve(L1^2 + 2*cq2*L1*L2 + L2^2==X^2+(Z-H)^2,cq2)

tq1=sym("tq1")  %% tan(q1)
tq1=solve(X/(Z-H)==(L1+L2*cos(q2)-L2*sin(q2)*tq1)/(L2*sin(q2)+(L1+L2*cos(q2))*tq1),tq1)


%%%%% testing

L1=2;L2=1;H=0;q1=pi/4; q2=pi/4;q3=0;
X=subs(x)
Z=subs(z)
double(subs(cq2))
double(subs(tq1))

