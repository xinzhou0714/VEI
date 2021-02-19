clear all
syms alpha  beta gamma q
syms Rx(alpha) 4
syms Ry(beta) 4
syms Rz(gamma) 4

%%%% Rx
Rx1_1(alpha)=1;
Rx2_1(alpha)=0;
Rx3_1(alpha)=0;

Rx1_2(alpha)=0;
Rx2_2(alpha)=cos(alpha);
Rx3_2(alpha)=sin(alpha);

Rx1_3(alpha)=0;
Rx2_3(alpha)=-sin(alpha);
Rx3_3(alpha)=cos(alpha);

%%%% Ry
Ry1_1(beta)=cos(beta);
Ry2_1(beta)=0;
Ry3_1(beta)=-sin(beta);

Ry1_2(beta)=0;
Ry2_2(beta)=1;
Ry3_2(beta)=0;

Ry1_3(beta)=sin(beta);
Ry2_3(beta)=0;
Ry3_3(beta)=cos(beta);

%%%% Rz
Rz1_1(gamma)=cos(gamma);
Rz2_1(gamma)=sin(gamma);
Rz3_1(gamma)=0;

Rz1_2(gamma)=-sin(gamma);
Rz2_2(gamma)=cos(gamma);
Rz3_2(gamma)=0;

Rz1_3(gamma)=0;
Rz2_3(gamma)=0;
Rz3_3(gamma)=1;


subs(Rx(alpha)* Ry(beta)*Rz(gamma+q))