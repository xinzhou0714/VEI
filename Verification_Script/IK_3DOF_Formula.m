clear all

syms H L1 L2
syms q [1 3]
syms a b c
syms p1 p2 p3 r1 r2 r3

f(a,b,c)=trotx(a)*troty(b)*trotz(c)

Tb1=transl(0,0,H)*trotx(pi/2)*trotz(q1);
T12=transl(L1,0,0)*trotz(q2);
T2ee=transl(L2,0,0)*trotz(q3);

Tb1=simplify(Tb1);
Tb2=simplify(Tb1*T12);
Tbee=simplify(Tb1*T12*T2ee)

x(H, L1, L2,q1,q2,q3)=Tbee(1,4)
y(H, L1, L2,q1,q2,q3)=Tbee(2,4)
z(H, L1, L2,q1,q2,q3)=Tbee(3,4)

Rb1=Tb1(1:3,1:3)
Rb2=Tb2(1:3,1:3)
Rbee=Tbee(1:3,1:3)

Rbeefun(q1,q2,q3)=Tbee(1:3,1:3)

omega_b1=Rb1*[0;0;1]
omega_b2=Rb2*[0;0;1]
omega_bee=Rbee*[0;0;1]

J_up=jacobian([x;y;z],[q1 q2 q3])
J_down=[omega_b1,omega_b2,omega_bee]

Jm=[J_up;J_down]

%T_res(p1, p2 ,p3, r1, r2 ,r3)=transl(p1,p2,p3)*trotx(r1)*troty(r2)*trotz(r3)
