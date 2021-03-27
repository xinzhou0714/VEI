clear all


% validation  for 3 dof


% current joint angles
qc=zeros(3,1);

H=1;L1=1;L2=2;
fraction=100;
%[x,y,z,rx,ry,rz]=fk(H,L1,L2,qc(1),qc(2),qc(3))
%[m,n]=myfun(2,4)
[x,y,z,rx,ry,rz]=fk(H,L1,L2,0,0,0)

fk_pos_vector(H,L1,L2,0,1,0)



function [x,y,z,rx,ry,rz]=fk(H,L1,L2,q1,q2,q3)
Tb1=transl(0,0,H)*trotx(pi/2)*trotz(q1);
T12=transl(L1,0,0)*trotz(q2);
T2ee=transl(L2,0,0)*trotz(q3);
Tbee=Tb1*T12*T2ee;
x=Tbee(1,4);
y=Tbee(2,4);
z=Tbee(3,4);
m_rot=Tbee(1:3,1:3);
rxyz=rotm2eul(m_rot);
rz=rxyz(1);
ry=rxyz(2);
rx=rxyz(3);

end


function mat=fk_pos_vector(H,L1,L2,q1,q2,q3)
[x,y,z,rx,ry,rz]=fk(H,L1,L2,q1,q2,q3);
mat=[x;y;z;rx;ry;rz];
end


function J=GetJacobianMatrix()

end
