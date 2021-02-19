clear all

%源代码的第一个关节从世界坐标系开始

%六个关节 即5段连杆
syms Lx [1 5]  %%% link displacement in x direction
syms Ly [1 5]  %%% link displacement in y direction
syms Lz [1 5]  %%% link displacement in z direction

%六个关节 有六个旋转角度

syms R [1 6]

%六个关节 有六个位置坐标
syms Jx [1 6]  %%% link displacement in x direction
syms Jy [1 6]  %%% link displacement in y direction
syms Jz [1 6]  %%% link displacement in z direction

% 表示源代码中的一些变量
a = cos(R1);
b = sin(R1);
c = Lx1;
d = Ly1;
e = Lz1;
f = cos(R2);
g = sin(R2);
h = Lx2;
i = Ly2;
j = Lz2;
k = cos(R3);
l = sin(R3);
m = Lx3;
n = Ly3;
o = Lz3;
p = cos(R4);
q = sin(R4);
r = Lx4;
s = Ly4;
t = Lz4;
u = cos(R5);
v = sin(R5);
w = Lx5;
x = Ly5;
y = Lz5;
A = cos(R6);
B = sin(R6);

Jx1=0;
Jy1=0;
Jz1=0;

Jx2=Jx1+ a * c - b * d
Jy2=Jy1+b * c + a * d
Jz2=Jz1+e

